require_relative 'neural_test'

module ItsAlive
  class LayerTest < NeuralTest
    def test_that_it_correctly_links_to_layer
      input = InputLayer.new(3, 3)
      output = OutputLayer.new(2)

      input.link_to(output)

      outbound = links_for(input, false)
      inbound = links_for(output, true)

      expected = input.length * output.length

      assert {
        outbound == expected &&
        inbound == expected
      }
    end

    def test_that_it_propagates_to_next_layer
      Settings.stub :weight, @weight_function do
        input = InputLayer.new(3, 3)
        output = OutputLayer.new(2)

        input.link_to(output)
        input.signal([1, 2, 3, 4, 5, 6, 7, 8, 9])
        input.propagate

        actual = output.output_values
        expected = [0.8305988329309042, 0.8344946489754106]

        assert { actual == expected }
      end
    end

    def test_that_it_calls_learn_on_previous_layer
      neuron = InterriorNeuron.new
      neuron.stub :learn, 0 do
        layer = HiddenLayer.new([neuron])
        mock = Minitest::Mock.new
        layer.previous = mock

        mock.expect :learn, true
        layer.learn

        assert { mock.verify }
      end
    end

    private

    def links_for(layer, inbound)
      layer.neurons.map { |neuron|
        synapses = inbound ?
          neuron.dendrites :
          neuron.axon_synapses
        synapses.length
      }.inject(&:+)
    end
  end
end
