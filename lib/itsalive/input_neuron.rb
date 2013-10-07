module ItsAlive
  class InputNeuron < InterriorNeuron
    def initialize(count = 1, &block)
      super(&block)
      add_inputs(count)
    end

    def add_input
      add_inputs(1)
    end

    def add_inputs(count)
      count.times { @dendrites << Synapse.input_to(self) }
      self
    end
  end
end
