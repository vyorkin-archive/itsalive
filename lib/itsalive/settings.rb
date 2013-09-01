require 'singleton'

module ItsAlive
  class Settings
    include Singleton

    attr_accessor :neuron_threshold, :activation_function

    def initialize
      @neuron_threshold = Defaults::THRESHOLD
      @activation_function = Activation::SIGMOID
    end
  end
end
