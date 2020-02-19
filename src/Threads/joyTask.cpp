#include "joyTask.h"

void loadJoyRefParam(double &RollMax, double &PitchMax, double &YawRateMax,
	                 double &maxThrust, double &xRate, double &yRate,
	                 double &zRate, double &PosRefTimeConstant){
	
	double RollMaxDeg, PitchMaxDeg, YawRateMaxDeg;

	ros::param::get("/px4_control_node/RollMax", RollMaxDeg);
  	ros::param::get("/px4_control_node/PitchMax", PitchMaxDeg);
  	ros::param::get("/px4_control_node/YawRateMax", YawRateMaxDeg);
  	ros::param::get("/px4_control_node/maxThrust", maxThrust);
  	ros::param::get("/px4_control_node/xRate", xRate);
  	ros::param::get("/px4_control_node/yRate", yRate);
  	ros::param::get("/px4_control_node/zRate", zRate);
  	ros::param::get("/px4_control_node/PosRefTimeConstant", PosRefTimeConstant);

  	RollMax = deg2rad(RollMaxDeg);
  	PitchMax = deg2rad(PitchMaxDeg);
  	YawRateMax = deg2rad(YawRateMaxDeg);
}


void *joyTaskTimer(void *threadID){

	ROS_INFO("joyTaskTimer has started!");
	int SamplingTime = 20;	//Sampling time in milliseconds

	while(1){
		WaitForEvent(syncEvents.Timeout,SamplingTime);

		//Check if thread should be terminated
		if(WaitForEvent(syncEvents.Terminate,0) == 0){
			break;
		}

		SetEvent(syncEvents.Joy_trigger);
	}
	
	ROS_INFO("Exiting joyTaskTimer...");

	//Shutdown here
	pthread_mutex_lock(&mutexes.threadCount);
        threadCount -= 1;
    pthread_mutex_unlock(&mutexes.threadCount);
	pthread_exit(NULL);
}

void *joyTask(void *threadID){

	//Local variables
	joyStruct prevJoy;  			//Save last value from joystick
	joyStruct localJoy; 			//Used to save global variable into local scope
	PVA_structure localPVA_ref;		//Used to save global variable into local scope
	StateMachine localFSM;			//Save state machine data locally
	nav_msgs::Odometry localOdom;	//Save odometry data locally
	geometry_msgs::Vector3 RPY_ref; //Roll-pitch-yaw reference
	Eigen::Vector3d Vel_ref;		//Reference velocity in position control
	float yawDot;
	Eigen::Matrix3d Rz;				//Rotation matrix around z axis


	//Max values for maneuvers
	double RollMax, PitchMax, YawRateMax, maxThrust;
	double xRate, yRate, zRate, PosRefTimeConstant;

	//Load max values for maneuvers
	loadJoyRefParam(RollMax, PitchMax, YawRateMax,
	                maxThrust, xRate, yRate, zRate, PosRefTimeConstant);


	//Wait until first message comes in
	localJoy.seq = -1;
	while(localJoy.seq <= 0){
		usleep(1000000);	//Sleep for 1s
		pthread_mutex_lock(&mutexes.joy);
	    	localJoy = joy;
	    pthread_mutex_unlock(&mutexes.joy);
	    ROS_INFO("Waiting for joystick data...");
	}
	prevJoy = localJoy;


	ROS_INFO("Joy Thread started!");

	ros::Time t_prev = ros::Time::now();
	ros::Time t_now = ros::Time::now();
	ros::Duration dt;

	while(1){
		WaitForEvent(syncEvents.Joy_trigger,500);

		//Check if thread should be terminated
		if(WaitForEvent(syncEvents.Terminate,0) == 0){
			break;
		}

		//Ellapsed time calculations
		t_now = ros::Time::now();
		dt = t_now - t_prev;
		t_prev = t_now;

		// ROS_INFO("Time: %f", dt.toSec());
		
		//Get latest joystick values
		pthread_mutex_lock(&mutexes.joy);
	    	localJoy = joy;
	    pthread_mutex_unlock(&mutexes.joy);

	    //Get information about state of the system
	    pthread_mutex_lock(&mutexes.FSM);
	    	localFSM = FSM;
	    pthread_mutex_unlock(&mutexes.FSM);

		//Get odometry info
	    pthread_mutex_lock(&mutexes.odom);
	    	localOdom = odom;
	    pthread_mutex_unlock(&mutexes.odom);

	    //Set events for pushing buttons
		if(localJoy.buttonA && !prevJoy.buttonA){
			SetEvent(joyEvents.buttonA);
		}
		if(localJoy.buttonB && !prevJoy.buttonB){
		    SetEvent(joyEvents.buttonB);
		}
		if(localJoy.buttonX && !prevJoy.buttonX){
		    SetEvent(joyEvents.buttonX);
		}
		if(localJoy.buttonY && !prevJoy.buttonY){
		    SetEvent(joyEvents.buttonY);
		}
		if(localFSM.State == localFSM.MODE_POSITION_ROS){  //Only set these events in POSITION_ROS mode
			if(joy.buttonL1 && !prevJoy.buttonL1){
		        SetEvent(joyEvents.buttonL1);
			}
		    if(joy.buttonR1 && !prevJoy.buttonR1){
		        SetEvent(joyEvents.buttonR1);
		    }
		    if(joy.buttonStart && !prevJoy.buttonStart){
		        SetEvent(joyEvents.buttonStart);
		    }
		}
		if(localJoy.buttonSelect && !prevJoy.buttonSelect){
		    SetEvent(joyEvents.buttonSelect);
		}
		if(localJoy.buttonLeft && !prevJoy.buttonLeft){
		    SetEvent(joyEvents.buttonLeft);
		}
		if(localJoy.buttonRight && !prevJoy.buttonRight){
		    SetEvent(joyEvents.buttonRight);
		}

		prevJoy = localJoy;


		//Update references in Joystick Reference Modes
		if(localFSM.State == localFSM.MODE_POSITION_JOY){
			//Reference velocity
			Vel_ref[0] = xRate*localJoy.RstickVer;
			Vel_ref[1] = yRate*localJoy.RstickHor;
			Vel_ref[2] = zRate*(localJoy.buttonR1 - localJoy.buttonL1);
			
			//Set yaw angle
			yawDot = (localJoy.R2 - 1)/2 - (localJoy.L2 - 1)/2;
			RPY_ref.x = 0;
			RPY_ref.y = 0;
			RPY_ref.z = RPY_ref.z + YawRateMax*yawDot*dt.toSec();

			//Check if integrating in body frame
			if(FSM.PosRefMode == FSM.POS_REF_BODY){
				Rz = rotz(RPY_ref.z); //Rotation about yaw reference
				Vel_ref = Rz*Vel_ref;
			}
			
			pthread_mutex_lock(&mutexes.PVAref);
				PVA_ref = filterJoy(PVA_ref, Vel_ref, dt.toSec(), PosRefTimeConstant);
				PVA_ref.Pos.pose.orientation = rpy2quat(RPY_ref);
			pthread_mutex_unlock(&mutexes.PVAref);

		}
		else if(localFSM.State == localFSM.MODE_ATTITUDE){
			RPY_ref.x = -RollMax*localJoy.RstickHor;
			RPY_ref.y = PitchMax*localJoy.RstickVer;
			yawDot = (localJoy.R2 - 1)/2 - (localJoy.L2 - 1)/2;
			RPY_ref.z = RPY_ref.z + YawRateMax*yawDot*dt.toSec();

			pthread_mutex_lock(&mutexes.PVAref);
		    	PVA_ref.Pos.pose.position = localOdom.pose.pose.position;
		    	PVA_ref.Pos.pose.orientation = rpy2quat(RPY_ref);
		    	PVA_ref.Vel.twist.linear = SetVector3(0, 0, 0);
		    	PVA_ref.Acc.accel.linear = SetVector3(0, 0, 0);
		    	PVA_ref.thrustRef.data = maxThrust*max(localJoy.LstickVer,0);
		    pthread_mutex_unlock(&mutexes.PVAref);
		}
		else if(localFSM.State == localFSM.MODE_POSITION_ROS){
			pthread_mutex_lock(&mutexes.PVAref);
				PVA_ref.Pos.pose.position = localOdom.pose.pose.position;
		    	PVA_ref.Pos.pose.orientation = localOdom.pose.pose.orientation;
		    	PVA_ref.Vel.twist.linear = SetVector3(0, 0, 0);
		    	PVA_ref.Acc.accel.linear = SetVector3(0, 0, 0);
		    	PVA_ref.thrustRef.data = 0.0;
		    pthread_mutex_unlock(&mutexes.PVAref);
            RPY_ref.z = getHeadingFromQuat(localOdom.pose.pose.orientation);
		}
		else{
			pthread_mutex_lock(&mutexes.PVAref);
		    	PVA_ref.Pos.pose.position = localOdom.pose.pose.position;
		    	PVA_ref.Pos.pose.orientation = localOdom.pose.pose.orientation;
		    	PVA_ref.Vel.twist.linear = SetVector3(0, 0, 0);
		    	PVA_ref.Acc.accel.linear = SetVector3(0, 0, 0);
		    	PVA_ref.thrustRef.data = 0.0;
		    pthread_mutex_unlock(&mutexes.PVAref);
		    RPY_ref.z = getHeadingFromQuat(localOdom.pose.pose.orientation);
		}

		//Set PVA_Ros structure to current states when not in PVA_ROS
		//  mode - avoids jumps when switching states
		if(localFSM.State != localFSM.MODE_POSITION_ROS){
		    pthread_mutex_lock(&mutexes.PVAref);
		    	localPVA_ref = PVA_ref;
		    pthread_mutex_unlock(&mutexes.PVAref);

			pthread_mutex_lock(&mutexes.PVA_ros);
		    	PVA_Ros.Pos = localPVA_ref.Pos.pose.position;
		    	PVA_Ros.yaw = getHeadingFromQuat(localOdom.pose.pose.orientation);
		    	PVA_Ros.Vel = SetVector3(0, 0, 0);
		    	PVA_Ros.Acc = SetVector3(0, 0, 0);
		    pthread_mutex_unlock(&mutexes.PVA_ros);	
		}
		

	}

	ROS_INFO("Exiting Joy Thread...");

	pthread_mutex_lock(&mutexes.threadCount);
        threadCount -= 1;
    pthread_mutex_unlock(&mutexes.threadCount);
	pthread_exit(NULL);
}