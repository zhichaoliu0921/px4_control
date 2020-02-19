; Auto-generated. Do not edit!


(cl:in-package px4_control-srv)


;//! \htmlinclude updatePx4param-request.msg.html

(cl:defclass <updatePx4param-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass updatePx4param-request (<updatePx4param-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <updatePx4param-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'updatePx4param-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name px4_control-srv:<updatePx4param-request> is deprecated: use px4_control-srv:updatePx4param-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <updatePx4param-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader px4_control-srv:data-val is deprecated.  Use px4_control-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <updatePx4param-request>) ostream)
  "Serializes a message object of type '<updatePx4param-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <updatePx4param-request>) istream)
  "Deserializes a message object of type '<updatePx4param-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<updatePx4param-request>)))
  "Returns string type for a service object of type '<updatePx4param-request>"
  "px4_control/updatePx4paramRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'updatePx4param-request)))
  "Returns string type for a service object of type 'updatePx4param-request"
  "px4_control/updatePx4paramRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<updatePx4param-request>)))
  "Returns md5sum for a message object of type '<updatePx4param-request>"
  "7d7333ae7553c5a384a7760af7ff3132")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'updatePx4param-request)))
  "Returns md5sum for a message object of type 'updatePx4param-request"
  "7d7333ae7553c5a384a7760af7ff3132")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<updatePx4param-request>)))
  "Returns full string definition for message of type '<updatePx4param-request>"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'updatePx4param-request)))
  "Returns full string definition for message of type 'updatePx4param-request"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <updatePx4param-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <updatePx4param-request>))
  "Converts a ROS message object to a list"
  (cl:list 'updatePx4param-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude updatePx4param-response.msg.html

(cl:defclass <updatePx4param-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass updatePx4param-response (<updatePx4param-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <updatePx4param-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'updatePx4param-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name px4_control-srv:<updatePx4param-response> is deprecated: use px4_control-srv:updatePx4param-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <updatePx4param-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader px4_control-srv:success-val is deprecated.  Use px4_control-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <updatePx4param-response>) ostream)
  "Serializes a message object of type '<updatePx4param-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <updatePx4param-response>) istream)
  "Deserializes a message object of type '<updatePx4param-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<updatePx4param-response>)))
  "Returns string type for a service object of type '<updatePx4param-response>"
  "px4_control/updatePx4paramResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'updatePx4param-response)))
  "Returns string type for a service object of type 'updatePx4param-response"
  "px4_control/updatePx4paramResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<updatePx4param-response>)))
  "Returns md5sum for a message object of type '<updatePx4param-response>"
  "7d7333ae7553c5a384a7760af7ff3132")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'updatePx4param-response)))
  "Returns md5sum for a message object of type 'updatePx4param-response"
  "7d7333ae7553c5a384a7760af7ff3132")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<updatePx4param-response>)))
  "Returns full string definition for message of type '<updatePx4param-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'updatePx4param-response)))
  "Returns full string definition for message of type 'updatePx4param-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <updatePx4param-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <updatePx4param-response>))
  "Converts a ROS message object to a list"
  (cl:list 'updatePx4param-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'updatePx4param)))
  'updatePx4param-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'updatePx4param)))
  'updatePx4param-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'updatePx4param)))
  "Returns string type for a service object of type '<updatePx4param>"
  "px4_control/updatePx4param")