module ItsAlive
  class OutputNeuron < Neuron
    def initialize(outputs, options = {})
      super(options)
      add_outputs(outputs)
    end

    def add_output
      add_outputs(1)
    end

    def add_outputs(number)
      number.times {
        link_to(Synapse.output_from(self))
      }
      self
    end

    alias_method :outputs, :axon_synapses
  end
end
