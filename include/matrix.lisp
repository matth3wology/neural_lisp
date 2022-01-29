
(defun random-weights (n m)
    "Create a random NxM matrix with values 0.0 to 1.0"
    (let ( (tmp-array (make-array (list n m))) )
    (dotimes (i n)
        (dotimes (j m)
            (setf (aref tmp-array i j) (- 1 (* 2.0 (random 1.0))))))
            tmp-array
    )
)

(defun dot-product (mat1 mat2)
    " Takes two matrices and performs a cross multiply"
   (let ((n (nth 0 (array-dimensions mat1)))
        (m (nth 1 (array-dimensions mat1)))
        (i (nth 0 (array-dimensions mat2)))
        (j (nth 1 (array-dimensions mat2))))
        (if (and (= n i) (= m j))
            (let ((tmp-array (make-array (list n m))))
                (dotimes (row-i n)
                    (dotimes (row-j m) 
                    (setf (aref tmp-array row-i row-j) (+(aref mat1 row-i row-j) (aref mat2 row-i row-j)))))
                tmp-array
            )
            (format t "Matrix dimensions do not match.~%")
        ))
)

(defun cross-multiply (mat1 mat2)
    " Takes two matrices and performs a dot product"
   (let ((n (nth 0 (array-dimensions mat1)))
        (m (nth 1 (array-dimensions mat1)))
        (i (nth 0 (array-dimensions mat2)))
        (j (nth 1 (array-dimensions mat2))))
        (if (= m i)
            (let ((tmp-array (make-array (list n j))))
                (dotimes (row-n n)
                    (dotimes (row-j j)
                        (let ((sum 0.0)) 
                        (dotimes (row-k i)
                            (setq sum (+ sum (* (aref mat1 row-n row-k) (aref mat2 row-k row-j))))
                        )
                        (setf (aref tmp-array row-n row-j) sum))))
                tmp-array
            )
            (format t "Matrix dimensions do not match.~%")
        ))
)
