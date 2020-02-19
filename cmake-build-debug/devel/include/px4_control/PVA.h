// Generated by gencpp from file px4_control/PVA.msg
// DO NOT EDIT!


#ifndef PX4_CONTROL_MESSAGE_PVA_H
#define PX4_CONTROL_MESSAGE_PVA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Vector3.h>

namespace px4_control
{
template <class ContainerAllocator>
struct PVA_
{
  typedef PVA_<ContainerAllocator> Type;

  PVA_()
    : Pos()
    , Vel()
    , Acc()
    , yaw(0.0)  {
    }
  PVA_(const ContainerAllocator& _alloc)
    : Pos(_alloc)
    , Vel(_alloc)
    , Acc(_alloc)
    , yaw(0.0)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _Pos_type;
  _Pos_type Pos;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _Vel_type;
  _Vel_type Vel;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _Acc_type;
  _Acc_type Acc;

   typedef double _yaw_type;
  _yaw_type yaw;





  typedef boost::shared_ptr< ::px4_control::PVA_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::px4_control::PVA_<ContainerAllocator> const> ConstPtr;

}; // struct PVA_

typedef ::px4_control::PVA_<std::allocator<void> > PVA;

typedef boost::shared_ptr< ::px4_control::PVA > PVAPtr;
typedef boost::shared_ptr< ::px4_control::PVA const> PVAConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::px4_control::PVA_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::px4_control::PVA_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace px4_control

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'px4_control': ['/home/zhichao/catkin_ws/src/px4_control/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::px4_control::PVA_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::px4_control::PVA_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::px4_control::PVA_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::px4_control::PVA_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::px4_control::PVA_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::px4_control::PVA_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::px4_control::PVA_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0a81b99d34d386c9e35014be5396c15b";
  }

  static const char* value(const ::px4_control::PVA_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0a81b99d34d386c9ULL;
  static const uint64_t static_value2 = 0xe35014be5396c15bULL;
};

template<class ContainerAllocator>
struct DataType< ::px4_control::PVA_<ContainerAllocator> >
{
  static const char* value()
  {
    return "px4_control/PVA";
  }

  static const char* value(const ::px4_control::PVA_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::px4_control::PVA_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Point Pos\n\
geometry_msgs/Vector3 Vel\n\
geometry_msgs/Vector3 Acc\n\
float64 yaw\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
# It is only meant to represent a direction. Therefore, it does not\n\
# make sense to apply a translation to it (e.g., when applying a \n\
# generic rigid transformation to a Vector3, tf2 will only apply the\n\
# rotation). If you want your data to be translatable too, use the\n\
# geometry_msgs/Point message instead.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::px4_control::PVA_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::px4_control::PVA_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.Pos);
      stream.next(m.Vel);
      stream.next(m.Acc);
      stream.next(m.yaw);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PVA_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::px4_control::PVA_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::px4_control::PVA_<ContainerAllocator>& v)
  {
    s << indent << "Pos: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.Pos);
    s << indent << "Vel: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.Vel);
    s << indent << "Acc: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.Acc);
    s << indent << "yaw: ";
    Printer<double>::stream(s, indent + "  ", v.yaw);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PX4_CONTROL_MESSAGE_PVA_H