//
// Created by zhichao on 2/18/20.
//
#include "ros/ros.h"
#include <iostream>
#include <px4_control/PVA.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>

//global
ros::Publisher trajPub;
px4_control::PVA msg;


geometry_msgs::Point pos;
geometry_msgs::Vector3 vel;
geometry_msgs::Vector3 acc;
double yaw;

// Publish trajectory in 50Hz

void timerCallback(const ros::TimerEvent& event){


    msg.Pos = pos;
    msg.Vel = vel;
    msg.Acc = acc;
    msg.yaw = yaw;

    trajPub.publish(msg);
}

int main(int argc, char **argv) {

    ros::init(argc, argv, "myTrajPublisher");
    ros::NodeHandle n;

    trajPub = n.advertise<px4_control::PVA>("/px4_control/PVA_Ref",10);
    ros::Timer TimerPub = n.createTimer(ros::Duration(0.02), timerCallback);


    pos.x = 0;
    pos.y = 0;
    pos.z = 1;
    vel.x = 0;
    vel.y = 0;
    vel.z = 0;
    acc.x = 0;
    acc.y = 0;
    acc.z = 0;

    yaw = 0;



    ros::spin();
return 0;

}



