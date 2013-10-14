require_relative '../minitest_helper'

module ItsAlive
  class OutputLayerTest < Minitest::Test
    def test_that_it_returns_currect_number_of_output_values
      assert { OutputLayer.new(3, 3).axon_synapses.length == 9 }
    end

    def test_that_it_adjusts_weights_on_previous_layers
      input = InputLayer.new(2, 1)
      hidden = HiddenLayer.new(3)
      output = OutputLayer.new(1, 1)

      hidden.link_to(output)
      input.link_to(hidden)

      input.signal([1, 1])
      input.propagate

      output.learn([1])

      expected = [
        0.06230083158485524,
        -0.3075746098964396,
        0.2007597631414849,
        -0.28865135292518307,
        -0.2444418086746201,
        0.1938446019974529
      ]

      actual = input.neurons.
        map(&:axon_synapses).flatten.
        map(&:output)

      assert { actual == expected }
    end
  end
end
