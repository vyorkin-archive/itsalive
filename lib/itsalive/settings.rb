require 'singleton'

module ItsAlive
  class Settings
    include Singleton

    attr_accessor :neuron_threshold,
                  :activation_function,
                  :weight_function

    def initialize
      @neuron_threshold = Defaults::THRESHOLD
      @activation_function = ActivationFunctions::SIGMOID
      @weight_function = WeightFunctions::RANDOM
    end

    def self.weight(*args)
      Settings.instance.weight_function.call(*args)
    end
  end
end
