// Auto-generated. Do not edit!

// (in-package px4_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class PVA {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Pos = null;
      this.Vel = null;
      this.Acc = null;
      this.yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('Pos')) {
        this.Pos = initObj.Pos
      }
      else {
        this.Pos = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('Vel')) {
        this.Vel = initObj.Vel
      }
      else {
        this.Vel = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('Acc')) {
        this.Acc = initObj.Acc
      }
      else {
        this.Acc = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PVA
    // Serialize message field [Pos]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.Pos, buffer, bufferOffset);
    // Serialize message field [Vel]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.Vel, buffer, bufferOffset);
    // Serialize message field [Acc]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.Acc, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float64(obj.yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PVA
    let len;
    let data = new PVA(null);
    // Deserialize message field [Pos]
    data.Pos = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [Vel]
    data.Vel = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [Acc]
    data.Acc = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 80;
  }

  static datatype() {
    // Returns string type for a message object
    return 'px4_control/PVA';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0a81b99d34d386c9e35014be5396c15b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point Pos
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PVA(null);
    if (msg.Pos !== undefined) {
      resolved.Pos = geometry_msgs.msg.Point.Resolve(msg.Pos)
    }
    else {
      resolved.Pos = new geometry_msgs.msg.Point()
    }

    if (msg.Vel !== undefined) {
      resolved.Vel = geometry_msgs.msg.Vector3.Resolve(msg.Vel)
    }
    else {
      resolved.Vel = new geometry_msgs.msg.Vector3()
    }

    if (msg.Acc !== undefined) {
      resolved.Acc = geometry_msgs.msg.Vector3.Resolve(msg.Acc)
    }
    else {
      resolved.Acc = new geometry_msgs.msg.Vector3()
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    return resolved;
    }
};

module.exports = PVA;
