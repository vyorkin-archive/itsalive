require_relative '../minitest_helper'

module ItsAlive
  class SynapseTest < Minitest::Test
    def test_that_it_has_default_random_weight
      synapse = Synapse.new(nil, nil)
      assert {
        synapse.weight > -1.0 &&
        synapse.weight < 1.0
      }
    end

    def test_that_it_produces_correct_output
      synapse = Synapse.new(nil, nil, 2)
      assert { synapse.signal(2.0) == 4.0 }
    end

    def test_that_it_adjusts_weight_using_gradient_descent
      source = Neuron.new
      target = OutputNeuron.new
      source.link_to(target, 0.1)
      source.instance_variable_set(:@output, 1)
      target.instance_variable_set(:@delta, 1)

      synapse = Synapse.new(source, target, 1)
      weight = synapse.adjust
      assert { weight == 1.24 }
    end
  end
end
