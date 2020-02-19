; Auto-generated. Do not edit!


(cl:in-package px4_control-msg)


;//! \htmlinclude PVA.msg.html

(cl:defclass <PVA> (roslisp-msg-protocol:ros-message)
  ((Pos
    :reader Pos
    :initarg :Pos
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (Vel
    :reader Vel
    :initarg :Vel
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (Acc
    :reader Acc
    :initarg :Acc
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass PVA (<PVA>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PVA>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PVA)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name px4_control-msg:<PVA> is deprecated: use px4_control-msg:PVA instead.")))

(cl:ensure-generic-function 'Pos-val :lambda-list '(m))
(cl:defmethod Pos-val ((m <PVA>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader px4_control-msg:Pos-val is deprecated.  Use px4_control-msg:Pos instead.")
  (Pos m))

(cl:ensure-generic-function 'Vel-val :lambda-list '(m))
(cl:defmethod Vel-val ((m <PVA>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader px4_control-msg:Vel-val is deprecated.  Use px4_control-msg:Vel instead.")
  (Vel m))

(cl:ensure-generic-function 'Acc-val :lambda-list '(m))
(cl:defmethod Acc-val ((m <PVA>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader px4_control-msg:Acc-val is deprecated.  Use px4_control-msg:Acc instead.")
  (Acc m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <PVA>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader px4_control-msg:yaw-val is deprecated.  Use px4_control-msg:yaw instead.")
  (yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PVA>) ostream)
  "Serializes a message object of type '<PVA>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Pos) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Vel) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Acc) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PVA>) istream)
  "Deserializes a message object of type '<PVA>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Pos) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Vel) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Acc) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PVA>)))
  "Returns string type for a message object of type '<PVA>"
  "px4_control/PVA")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PVA)))
  "Returns string type for a message object of type 'PVA"
  "px4_control/PVA")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PVA>)))
  "Returns md5sum for a message object of type '<PVA>"
  "0a81b99d34d386c9e35014be5396c15b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PVA)))
  "Returns md5sum for a message object of type 'PVA"
  "0a81b99d34d386c9e35014be5396c15b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PVA>)))
  "Returns full string definition for message of type '<PVA>"
  (cl:format cl:nil "geometry_msgs/Point Pos~%geometry_msgs/Vector3 Vel~%geometry_msgs/Vector3 Acc~%float64 yaw~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PVA)))
  "Returns full string definition for message of type 'PVA"
  (cl:format cl:nil "geometry_msgs/Point Pos~%geometry_msgs/Vector3 Vel~%geometry_msgs/Vector3 Acc~%float64 yaw~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PVA>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Pos))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Vel))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Acc))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PVA>))
  "Converts a ROS message object to a list"
  (cl:list 'PVA
    (cl:cons ':Pos (Pos msg))
    (cl:cons ':Vel (Vel msg))
    (cl:cons ':Acc (Acc msg))
    (cl:cons ':yaw (yaw msg))
))
