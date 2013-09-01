module ItsAlive
  class InputLayer < Layer
    def initialize(size, inputs = 1)
      super(Array.new(size) { InputNeuron.new(inputs) })
    end

    def dendrites
      @neurons.map(&:dendrites).flatten
    end

    def signal(values)
      dendrites.zip(values) { |dendrite, value|
        dendrite.signal(value)
      }
    end

    alias_method :inputs, :dendrites
  end
end
