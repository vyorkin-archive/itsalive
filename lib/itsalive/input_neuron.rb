module ItsAlive
  class InputNeuron < Neuron
    def initialize(inputs, options = {})
      super(options)
      add_inputs(inputs)
    end

    def add_input
      add_inputs(1)
    end

    def add_inputs(number)
      number.times {
        link_from(Synapse.input_to(self))
      }
      self
    end

    alias_method :inputs, :dendrites
    alias_method :receptors, :dendrites
  end
end
