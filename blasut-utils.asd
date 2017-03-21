;;;; blasut-utils.asd

(asdf:defsystem #:blasut-utils
  :description "blasut-utils"
  :author "blasut <blasut937@gmail.com>"
  :license "MIT"
  ;;:depends-on (#:alexandria)
  :serial t
  :components ((:file "package")
               (:file "utils")))
