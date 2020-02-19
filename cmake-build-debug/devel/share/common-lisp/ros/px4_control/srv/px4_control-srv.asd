
(cl:in-package :asdf)

(defsystem "px4_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "updatePx4param" :depends-on ("_package_updatePx4param"))
    (:file "_package_updatePx4param" :depends-on ("_package"))
  ))