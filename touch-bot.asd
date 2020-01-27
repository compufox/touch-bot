;;;; touch-bot.asd

(asdf:defsystem #:touch-bot
  :description ""
  :author "ava fox"
  :license  "NPLv1+"
  :version "0.1"
  :serial t
  :depends-on (#:glacier #:textery #:with-user-abort)
  :components ((:file "package")
               (:file "touch-bot"))  
  :build-operation "program-op"
  :build-pathname "bin/touch-bot"
  :entry-point "touch-bot::main")

#+sb-core-compression
(defmethod asdf:perform ((o asdf:image-op) (c asdf:system))
  (uiop:dump-image (asdf:output-file o c) :executable t :compression t))

