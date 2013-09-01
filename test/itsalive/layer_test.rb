require_relative '../minitest_helper'

module ItsAlive
  class LayerTest < Minitest::Test
    def test_that_it_creates_neurons
      layer = Layer.new(4, Neuron)
      assert { layer.neurons.lenght == 4 }
    end

    def test_that_it_correctly_links_to_layer
      input_layer = Layer.input(3)
      output_layer = Layer.output(2)

      inbound = links_for(input_layer, true)
      outbound = links_for(output_layer, false)
      expected = input_layer.length * output_layer.length

      assert {
        inbound == expected &&
        outbound == expected
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
