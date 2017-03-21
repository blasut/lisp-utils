;;; this file is for playing around with stuff.
;;; it is not included in the package export
(in-package #:blasut-utils)

(defun curry (func &rest args)
  "Used to create a curried function, has to be used with funcall because cl is a lisp-2. for example: (funcall (curry #'+ 3) 5)"
  (lambda (&rest more-args)
    (apply func (append args more-args))))

(defun thread-it (&rest fns)
  "thread-it can be used to concat curried functioncalls into one lambda"
  (lambda (initial)
    (reduce (lambda (acc f)
              (funcall f acc)) fns :initial-value initial)))

(funcall (thread-it (curry #'+ 1)
                    (curry #'+ 2))
         2)

(thread-it (curry #'+ 1)
           (curry #'+ 2)
           (curry #'- 2))

(funcall (thread-it (curry #'+ 1)
           (curry #'+ 2)
           (curry #'- 2)) 0)


(defmacro exec-thread-it (start &body fns)
  `(funcall (thread-it ,@fns) ,start))

(exec-thread-it 0 (curry #'+ 1) (curry #'+ 1))
