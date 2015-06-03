(defmacro str (&rest body)
  `(concatenate 'string ,@body))
