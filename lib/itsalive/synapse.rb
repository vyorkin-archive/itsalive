 module ItsAlive
  class Synapse
    attr_accessor :weight, :signal

    def initialize(weight = 1.0, signal = 0.0)
      @weight, @signal = weight, signal
    end

    def output
      weight * signal
    end
  end
 end
