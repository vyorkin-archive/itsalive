require 'singleton'

module ItsAlive
  class Settings
    include Singleton

    attr_accessor :neuron_threshold, :activation_function
    attr_writer :random

    def initialize
      @neuron_threshold = Defaults::THRESHOLD
      @activation_function = Activation::SIGMOID
      @random = Randomizer::DEFAULT
    end

    def random(*args)
      @random.call(*args)
    end
  end
end
