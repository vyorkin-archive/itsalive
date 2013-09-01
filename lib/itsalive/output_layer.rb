module ItsAlive
  class OutputLayer < Layer
    def initialize(size, outputs = 1)
      super(Array.new(size) { OutputNeuron.new(outputs) })
    end

    def outputs
      @neurons.map { |neuron|
        neuron.axon_synapses.map(&:output)
      }.flatten
    end
  end
end
