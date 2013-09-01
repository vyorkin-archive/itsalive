require_relative '../minitest_helper'

module ItsAlive
  class LayerTest < Minitest::Test
    def test_that_it_creates_neurons
      layer = Layer.hidden(4)
      assert { layer.neurons.length == 4 }
    end

    def test_that_it_correctly_links_to_layer
      input = Layer.input(3, 3)
      output = Layer.output(2)

      input.link_to(output)

      outbound = links_for(input, false)
      inbound = links_for(output, true)

      expected = input.length * output.length

      assert {
        outbound == expected &&
        inbound == expected
      }
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
