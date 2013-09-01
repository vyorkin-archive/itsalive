module ItsAlive
  class OutputNeuron < Neuron
    def initialize(count = 1, &block)
      super(&block)
      add_outputs(count)
    end

    def add_output
      add_outputs(1)
    end

    def add_outputs(count)
      count.times { @axon_synapses << Synapse.output_from(self) }
      self
    end
  end
end
