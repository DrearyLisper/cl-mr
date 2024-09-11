(defpackage :main
  (:use common-lisp)
  (:export main))

(in-package :main)

(ql:quickload :woo)

(defun main ()
  (woo:run
   (lambda (env)
     (declare (ignore env))
     '(200 (:content-type "text/plain") ("Hello, world!")))
   :address "0.0.0.0"
   :port 12345))
