require_relative '../minitest_helper'

class NeuronTest < Minitest::Test
  def setup
    @subject = ItsAlive::Neuron.new([0.1, 0.2, 0.3], 1)
    @signals = [1, 2, 3]
  end

  def test_that_it_correctly_activates_using_sigmoid_function
    assert { @subject.activate(@signals) == 0.9168273035060777 }
  end
end
