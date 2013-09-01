require_relative '../minitest_helper'

module ItsAlive
  class InputLayerTest < Minitest::Test
    def test_that_it_returns_current_number_of_input_dendrites
      assert { InputLayer.new(3, 3).inputs.length == 9 }
    end
  end
end
