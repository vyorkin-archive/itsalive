require_relative 'neural_test'

module ItsAlive
  class NeuronTest < NeuralTest
    def test_that_it_links_to_neuron
      neuron = Neuron.new.link_to(Neuron.new)
      assert { neuron.axon_synapses.length == 1 }
    end

    def test_that_it_activates_using_default_sigmoid_function
      neuron = create_neuron(3, 0)
      neuron.signal([1, 2, 3])

      assert { neuron.activate == 0.9168273035060777 }
    end

    def test_that_it_transmits_output_signal_to_its_axon_synapses
      neuron = create_neuron(3, 3)
      neuron.signal([1, 2, 3]).activate

      output = neuron.output_values
      expected = [
        0.09168273035060777,
        0.18336546070121554,
        0.27504819105182327
      ]

      assert { output == expected }
    end

    def test_that_it_correctly_calculates_delta
      output = OutputNeuron.new

      interrior = create_neuron(1, 0, InterriorNeuron).
                  link_to(output, 0.1)

      output.signal([1]).activate
      output.learn(1)

      interrior.signal([1]).activate
      interrior.learn

      assert { interrior.delta == -0.0011854997141506037 }
    end

    private

    def create_neuron(inputs, outputs, klass = Neuron)
      neuron = klass.new

      weight = -> (index) {
        number = index + 1
        block_given? ?
          yield(number) :
          number / 10.0
      }

      dendrites = Array.new(inputs) { |i|
        Synapse.input_to(neuron, weight.call(i))
      }
      axon_synapses = Array.new(outputs) { |o|
        Synapse.output_from(neuron, weight.call(o))
      }

      neuron.dendrites.concat(dendrites)
      neuron.axon_synapses.concat(axon_synapses)

      neuron
    end
  end
end
