require_relative '../minitest_helper'

module ItsAlive
  class NeuralTest < Minitest::Test
    def setup
      @weights = (0.1..1.0).step(0.01).to_a
      @synapse_index = 0
      @weight_function = -> {
        weight = @weights[@synapse_index]
        @synapse_index += 1
        weight
      }
    end
  end
end
