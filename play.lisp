;;; this file is for playing around with stuff.
;;; it is not included in the package export
(in-package #:blasut-utils)

; http://blog.thezerobit.com/2012/07/28/lazy-sequences-in-common-lisp.html

(defun curry (func &rest args)
  "Used to create a curried function, has to be used with funcall because cl is a lisp-2. for example: (funcall (curry #'+ 3) 5)"
  (lambda (&rest more-args)
    (apply func (append args more-args))))

(defun exec-thread-it (&rest fns)
  "exec-thread-it can be used to concat curried functioncalls into one lambda"
  (lambda (initial)
    (reduce (lambda (acc f)
              (funcall f acc)) fns :initial-value initial)))

(funcall (exec-thread-it (curry #'+ 1)
           (curry #'+ 2))
         2)

(exec-thread-it (curry #'+ 1)
  (curry #'+ 2)
  (curry #'- 2))

(funcall (exec-thread-it (curry #'+ 1)
           (curry #'+ 2)
           (curry #'- 2)) 0)


(defmacro thread-it (start &body fns)
  `(funcall (exec-thread-it ,@fns) ,start))

(thread-it 0
           (curry #'+ 1)
           (curry #'+ 1))

(destructuring-bind (x (y1 y2) z) (list 1 (list 2 20) 3)
  (list :x x :y1 y1 :y2 y2 :z z))

;; is this good syntax? not the same as let, but we can also only bind one var...

(let ((x 5))
  (print x))

(if-let (x 5)
  (print x))

(if-let (x nil)
  (print x))

(if-let (x (> 5 0))
  (print x)
  (print "lol"))

