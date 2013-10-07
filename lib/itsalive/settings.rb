require 'singleton'

module ItsAlive
  class Settings
    include Singleton

    attr_accessor :neuron_threshold,
                  :learning_rate,
                  :momentum,
                  :activation_function,
                  :activation_derivative_function,
                  :weight_function

    def initialize
      @neuron_threshold = Defaults::THRESHOLD
      @learning_rate = Defaults::LEARNING_RATE
      @momentum = Defaults::MOMENTUM
      @activation_function = ActivationFunctions::SIGMOID
      @activation_derivative_function = ActivationFunctions::SIGMOID_DERIVATIVE
      @weight_function = WeightFunctions::RANDOM
    end

    def self.weight(*args)
      Settings.instance.weight_function.call(*args)
    end
  end
end
