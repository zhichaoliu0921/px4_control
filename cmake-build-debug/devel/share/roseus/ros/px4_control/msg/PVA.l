;; Auto-generated. Do not edit!


(when (boundp 'px4_control::PVA)
  (if (not (find-package "PX4_CONTROL"))
    (make-package "PX4_CONTROL"))
  (shadow 'PVA (find-package "PX4_CONTROL")))
(unless (find-package "PX4_CONTROL::PVA")
  (make-package "PX4_CONTROL::PVA"))

(in-package "ROS")
;;//! \htmlinclude PVA.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass px4_control::PVA
  :super ros::object
  :slots (_Pos _Vel _Acc _yaw ))

(defmethod px4_control::PVA
  (:init
   (&key
    ((:Pos __Pos) (instance geometry_msgs::Point :init))
    ((:Vel __Vel) (instance geometry_msgs::Vector3 :init))
    ((:Acc __Acc) (instance geometry_msgs::Vector3 :init))
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _Pos __Pos)
   (setq _Vel __Vel)
   (setq _Acc __Acc)
   (setq _yaw (float __yaw))
   self)
  (:Pos
   (&rest __Pos)
   (if (keywordp (car __Pos))
       (send* _Pos __Pos)
     (progn
       (if __Pos (setq _Pos (car __Pos)))
       _Pos)))
  (:Vel
   (&rest __Vel)
   (if (keywordp (car __Vel))
       (send* _Vel __Vel)
     (progn
       (if __Vel (setq _Vel (car __Vel)))
       _Vel)))
  (:Acc
   (&rest __Acc)
   (if (keywordp (car __Acc))
       (send* _Acc __Acc)
     (progn
       (if __Acc (setq _Acc (car __Acc)))
       _Acc)))
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _Pos
    (send _Pos :serialization-length)
    ;; geometry_msgs/Vector3 _Vel
    (send _Vel :serialization-length)
    ;; geometry_msgs/Vector3 _Acc
    (send _Acc :serialization-length)
    ;; float64 _yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _Pos
       (send _Pos :serialize s)
     ;; geometry_msgs/Vector3 _Vel
       (send _Vel :serialize s)
     ;; geometry_msgs/Vector3 _Acc
       (send _Acc :serialize s)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _Pos
     (send _Pos :deserialize buf ptr-) (incf ptr- (send _Pos :serialization-length))
   ;; geometry_msgs/Vector3 _Vel
     (send _Vel :deserialize buf ptr-) (incf ptr- (send _Vel :serialization-length))
   ;; geometry_msgs/Vector3 _Acc
     (send _Acc :deserialize buf ptr-) (incf ptr- (send _Acc :serialization-length))
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get px4_control::PVA :md5sum-) "0a81b99d34d386c9e35014be5396c15b")
(setf (get px4_control::PVA :datatype-) "px4_control/PVA")
(setf (get px4_control::PVA :definition-)
      "geometry_msgs/Point Pos
geometry_msgs/Vector3 Vel
geometry_msgs/Vector3 Acc
float64 yaw
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :px4_control/PVA "0a81b99d34d386c9e35014be5396c15b")


