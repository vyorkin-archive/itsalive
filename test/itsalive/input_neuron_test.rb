require_relative '../minitest_helper'

module ItsAlive
  class InputNeuronTest < Minitest::Test
    def test_that_it_can_add_inputs
      neuron = InputNeuron.new(3)
      assert { neuron.inputs.length == 3 }
    end
  end
end
