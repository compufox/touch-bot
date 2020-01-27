;;;; touch-bot.asd

(asdf:defsystem #:touch-bot
  :description ""
  :author "ava fox"
  :license  "NPLv1+"
  :version "0.1"
  :serial t
  :depends-on (#:glacier #:textery #:with-user-abort)
  :components ((:file "package")
               (:file "touch-bot")))
