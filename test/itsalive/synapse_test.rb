require_relative '../minitest_helper'

class SynapseTest < Minitest::Test
  def setup
    @subject = ItsAlive::Synapse.new(0.2, 1.3)
  end

  def test_that_output_is_a_product_of_signal_and_weight
    assert { @subject.output == 0.2 * 1.3 }
  end
end
