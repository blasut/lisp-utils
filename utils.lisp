(in-package #:blasut-utils)

(defmacro comment (&body body)
  (declare (ignore body)))

(defmacro str (&rest body)
  `(concatenate 'string ,@body))
