require_relative 'neural_test'

module ItsAlive
  class InputLayerTest < NeuralTest
    def test_that_it_returns_current_number_of_input_dendrites
      assert { InputLayer.new(3, 3).dendrites.length == 9 }
    end
  end
end
