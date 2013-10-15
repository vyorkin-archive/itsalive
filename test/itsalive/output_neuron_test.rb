require_relative 'neural_test'

module ItsAlive
  class OutputNeuronTest < NeuralTest
    def test_that_it_can_add_outputs
      neuron = OutputNeuron.new(3)
      assert { neuron.outputs.length == 3 }
    end

    def test_that_it_correctly_calculates_delta
      neuron = OutputNeuron.new(1)
      neuron.dendrites << Synapse.input_to(neuron, 0.5)

      neuron.signal([1]).activate
      neuron.learn(1)

      assert { neuron.delta == -0.03876033167077969 }
    end
  end
end
