module ItsAlive
  class Layer
    class << self
      def input(size, inputs = 1)
        Layer.new(Array.new(size) { InputNeuron.new(inputs) })
      end

      def hidden(size)
        Layer.new(Array.new(size) { Neuron.new })
      end

      def output(size, outputs = 1)
        Layer.new(Array.new(size) { OutputNeuron.new(outputs) })
      end
    end

    attr_accessor :next, :previous
    attr_reader :neurons, :error

    def initialize(neurons)
      @neurons = neurons
      @error = 0.0
    end

    def link_to(layer)
      @next = layer
      layer.next = self

      @neurons.product(layer.neurons) do |source, target|
        source.link_to(target)
      end

      self
    end

    def length
      @neurons.length
    end

    def <<(neuron)
      @neurons << neuron
      self
    end

    alias_method :connect_to, :link_to
  end
end
