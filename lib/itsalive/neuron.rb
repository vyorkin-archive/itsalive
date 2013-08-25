module ItsAlive
  class Neuron
    def initialize(weights, bias = 0, options = {})
      @weights, @bias = weights, bias
      @activation = options[:activation] || Activation::SIGMOID
    end

    def activate(signals)
      @activation.call(sum(signals) + @bias)
    end

    private

    def sum(signals)
      @weights.zip(signals).
        map { |x, y| x * y }.
        inject(&:+)
    end
  end
end
