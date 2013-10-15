require_relative 'neural_test'

module ItsAlive
  class OutputLayerTest < NeuralTest
    def test_that_it_returns_currect_number_of_output_values
      assert { OutputLayer.new(3, 3).axon_synapses.length == 9 }
    end

    def test_that_it_adjusts_weights_on_previous_layers
      Settings.stub :weight, @weight_function do
        input = InputLayer.new(2, 1)
        hidden = HiddenLayer.new(3)
        output = OutputLayer.new(1, 1)


        hidden.link_to(output)
        input.link_to(hidden)

        initial = input.output_weights

        input.signal([1, 1])
        input.propagate

        output.learn([1])

        expected = [
          0.1497860124193207, 0.1597684027733649, 0.1697508258618579,
          0.1797854793454761, 0.18976782583135918, 0.19975020513323727
        ]

        actual = input.output_weights

        assert {
          initial != actual &&
          actual == expected
        }
      end
    end
  end
end
