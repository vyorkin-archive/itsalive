require_relative '../minitest_helper'

module ItsAlive
  class OutputNeuronTest < Minitest::Test
    def test_that_it_can_add_outputs
      neuron = OutputNeuron.new(3)
      assert { neuron.outputs.length == 3 }
    end
  end
end
