# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "px4_control: 1 messages, 1 services")

set(MSG_I_FLAGS "-Ipx4_control:/home/zhichao/catkin_ws/src/px4_control/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(px4_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg" NAME_WE)
add_custom_target(_px4_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "px4_control" "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg" "geometry_msgs/Point:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv" NAME_WE)
add_custom_target(_px4_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "px4_control" "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(px4_control
  "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/px4_control
)

### Generating Services
_generate_srv_cpp(px4_control
  "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/px4_control
)

### Generating Module File
_generate_module_cpp(px4_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/px4_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(px4_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(px4_control_generate_messages px4_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg" NAME_WE)
add_dependencies(px4_control_generate_messages_cpp _px4_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv" NAME_WE)
add_dependencies(px4_control_generate_messages_cpp _px4_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(px4_control_gencpp)
add_dependencies(px4_control_gencpp px4_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS px4_control_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(px4_control
  "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/px4_control
)

### Generating Services
_generate_srv_eus(px4_control
  "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/px4_control
)

### Generating Module File
_generate_module_eus(px4_control
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/px4_control
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(px4_control_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(px4_control_generate_messages px4_control_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg" NAME_WE)
add_dependencies(px4_control_generate_messages_eus _px4_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv" NAME_WE)
add_dependencies(px4_control_generate_messages_eus _px4_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(px4_control_geneus)
add_dependencies(px4_control_geneus px4_control_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS px4_control_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(px4_control
  "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/px4_control
)

### Generating Services
_generate_srv_lisp(px4_control
  "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/px4_control
)

### Generating Module File
_generate_module_lisp(px4_control
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/px4_control
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(px4_control_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(px4_control_generate_messages px4_control_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg" NAME_WE)
add_dependencies(px4_control_generate_messages_lisp _px4_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv" NAME_WE)
add_dependencies(px4_control_generate_messages_lisp _px4_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(px4_control_genlisp)
add_dependencies(px4_control_genlisp px4_control_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS px4_control_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(px4_control
  "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/px4_control
)

### Generating Services
_generate_srv_nodejs(px4_control
  "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/px4_control
)

### Generating Module File
_generate_module_nodejs(px4_control
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/px4_control
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(px4_control_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(px4_control_generate_messages px4_control_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg" NAME_WE)
add_dependencies(px4_control_generate_messages_nodejs _px4_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv" NAME_WE)
add_dependencies(px4_control_generate_messages_nodejs _px4_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(px4_control_gennodejs)
add_dependencies(px4_control_gennodejs px4_control_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS px4_control_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(px4_control
  "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/px4_control
)

### Generating Services
_generate_srv_py(px4_control
  "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/px4_control
)

### Generating Module File
_generate_module_py(px4_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/px4_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(px4_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(px4_control_generate_messages px4_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/msg/PVA.msg" NAME_WE)
add_dependencies(px4_control_generate_messages_py _px4_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhichao/catkin_ws/src/px4_control/srv/updatePx4param.srv" NAME_WE)
add_dependencies(px4_control_generate_messages_py _px4_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(px4_control_genpy)
add_dependencies(px4_control_genpy px4_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS px4_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/px4_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/px4_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(px4_control_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(px4_control_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/px4_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/px4_control
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(px4_control_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(px4_control_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/px4_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/px4_control
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(px4_control_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(px4_control_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/px4_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/px4_control
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(px4_control_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(px4_control_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/px4_control)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/px4_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/px4_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(px4_control_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(px4_control_generate_messages_py geometry_msgs_generate_messages_py)
endif()
