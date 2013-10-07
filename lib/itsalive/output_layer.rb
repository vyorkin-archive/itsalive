module ItsAlive
  class OutputLayer < Layer
    def initialize(size, outputs = 1)
      super(Array.new(size) { OutputNeuron.new(outputs) })
    end

    def axon_synapses
      @neurons.map(&:axon_synapses).flatten
    end

    def output_values
      axon_synapses.map(&:output)
    end

    def learn(desired)
      @neurons.zip(desired) { |neuron, value|
        neuron.learn(value)
      }
      @previous.learn if @previous
    end

    alias_method :outputs, :axon_synapses
  end
end
