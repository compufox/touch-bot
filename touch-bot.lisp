;;;; touch-bot.lisp

(in-package #:touch-bot)

(defun generate-text ()
  (expand "touch #adjective# get #noun#"))

(defun make-reply (notif)
  (when (mention-p notif)
    (reply (tooter:status notif)
	   (generate-text))))

(defun main ()
  (load-grammar-directory "grammar/")
  
  (handler-case
      (with-user-abort
	(run-bot (make-instance 'mastodon-bot
				:config-file "bot.config"
				:on-notification #'make-reply)
	  (after-every (90 :minutes)
	    (post (generate-text) :visibility :public))))
    (user-abort ()
      (format t "shutting down~%"))
    (error (e)
      (format t "unrecoverable error: ~a~%" e))))
