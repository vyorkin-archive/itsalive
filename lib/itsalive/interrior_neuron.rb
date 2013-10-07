module ItsAlive
  class InterriorNeuron < Neuron
    def initialize(&block)
      super(&block)
    end

    def learn
      calculate_error
      calculate_delta
      adjust_weights
    end

    protected

    def calculate_delta
      @delta = derivative * @error
    end

    def calculate_error
      @error = @axon_synapses.collect { |synapse|
        synapse.target.delta * synapse.weight
      }.inject(&:+)
    end
  end
end
