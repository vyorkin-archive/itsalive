module ItsAlive
  class InputLayer < Layer
    def initialize(size, inputs = 1)
      super(Array.new(size) { InputNeuron.new(inputs) })
    end

    def inputs
      @neurons.map(&:dendrites).flatten
    end
  end
end
