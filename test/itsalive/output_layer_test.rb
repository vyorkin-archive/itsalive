require_relative '../minitest_helper'

module ItsAlive
  class OutputLayerTest < Minitest::Test
    def test_that_it_returns_currect_number_of_output_values
      assert { OutputLayer.new(3, 3).outputs.length == 9 }
    end
  end
end
