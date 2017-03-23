(in-package #:blasut-utils)

(defmacro comment (&body body)
  "ignores everything inside the body"
  (declare (ignore body)))

(defmacro str (&rest body)
  "takes a bunch of strings and concs them to a new string"
  `(concatenate 'string ,@body))

(defmacro if-let ((form test) then &optional else)
  "if-let is used to bind and check the result at the same time. syntax is: (if-let (x (> 5 0)) then else). optional else"
  (let ((temp (gensym "temp")))
   `(let ((,temp ,test))
      (if ,temp
          (let ((,form ,temp))
            ,then)
          ,else))))
