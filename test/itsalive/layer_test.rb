require_relative '../minitest_helper'

module ItsAlive
  class LayerTest < Minitest::Test
    def setup
      @weights = (0.1..1.0).step(0.01).to_a
      @synapse_index = 0
      @weight_function = -> {
        weight = @weights[@synapse_index]
        @synapse_index += 1
        weight
      }
    end

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
