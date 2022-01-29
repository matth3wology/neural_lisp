(require "include/matrix.lisp")
(require "include/activation.lisp")

(defun activate-neuron (input weight)
    "Neruon activation function"
    (activate-sigmoid (cross-multiply input weight)))

; Create the input matrix [150,5])
(setf input-matrix (random-weights 150 5))

; Initialize the weights
(setf weight1 (random-weights 5 6))
(setf weight2 (random-weights 6 12))
(setf weight3 (random-weights 12 11))

; Feed Forward throuh Hidden Layers
(setf h1 (activate-neuron input-matrix weight1)) ; Hidden Layer 1 ≅ σ(x*W1)
(setf h2 (activate-neuron h1 weight2)) ; Hidden Layer 2 ≅ σ(h1*W1)
(setf h3 (activate-neuron h2 weight3)) ; Hidden Layer 3 ≅ σ(h2*W1)

; TO-DO: Implement loss function

; TO-DO: Check accuracy

; TO-DO: Update Weights

; Jump back through loop

(print h3)