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

    def test_that_it_adjusts_weight_by_delta
      synapse = Synapse.new(nil, nil, 1)
      assert { synapse.adjust(0.02) == 1.02 }
    end
  end
end
