module ItsAlive
  module ActivationFunctions
    LINEAR = -> (x) { x }
    LINEAR_DERIVATIVE = -> (x) { 1 }

    SIN = -> (x) { Math.sin(x) }
    SIN_DERIVATIVE = -> (x) { Math.cos(x) }

    COS = -> (x) { Math.cos(x) }
    COS_DERIVATIVE = -> (x) { Math.sin(x) }

    TANH = -> (x) { Math.tanh(x) }
    TANH_DERIVATIVE = -> (x) { (1 / Math.cosh(x)) ** 2 }

    UNIT_STEP = -> (x) { x < 0.0 ? 0.0 : 1.0 }

    SIGMOID = -> (x) { 1 / (1 + Math.exp(-x)) }
    SIGMOID_DERIVATIVE = -> (x) { SIGMOID.call(x) * (1 - SIGMOID.call(x)) }

    HYPERBOLIC_TANH = -> (x) { (Math.exp(2 * x) - 1) * (Math.exp(2 * x) + 1) }
    HYPERBOLIC_TANH_DERIVATIVE = -> (x) { 1 - HYPERBOLIC_TANH.call(x) ** 2 }
  end
end
