
(cl:in-package :asdf)

(defsystem "px4_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "PVA" :depends-on ("_package_PVA"))
    (:file "_package_PVA" :depends-on ("_package"))
  ))