require_relative '../minitest_helper'

module ItsAlive
  class NeuronTest < Minitest::Test
    def test_that_it_can_link_from_neuron
     neuron = Neuron.new.link_from(Neuron.new)
     assert { neuron.dendrites.length == 1 }
    end

    def test_that_it_can_link_from_synapse
     neuron = Neuron.new.link_from(Synapse.new(nil, nil))
     assert { neuron.dendrites.length == 1 }
    end

    def test_that_it_can_link_to_neuron
      neuron = Neuron.new.link_to(Neuron.new)
      assert { neuron.axon_synapses.length == 1 }
    end

    def test_that_it_can_link_to_synapse
      neuron = Neuron.new.link_to(Synapse.new(nil, nil))
      assert { neuron.axon_synapses.length == 1 }
    end

    def test_that_it_activates_using_default_sigmoid_function
      neuron = Neuron.new.
        link_from(Synapse.new(nil, nil, 0.1)).
        link_from(Synapse.new(nil, nil, 0.2)).
        link_from(Synapse.new(nil, nil, 0.3))

      signals = [1, 2, 3]

      assert { neuron.activate(signals) == 0.9168273035060777 }
    end
  end
end
