module ItsAlive
  class Layer
    attr_accessor :next, :previous
    attr_reader :neurons, :error

    def initialize(neurons)
      @neurons = neurons
      @error = 0.0
    end

    def link_to(layer)
      @next = layer
      layer.previous = self

      @neurons.product(layer.neurons) do |source, target|
        source.link_to(target)
      end

      self
    end

    def propagate
      @neurons.map(&:activate)
      @next.propagate if @next
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

  HiddenLayer = Layer
end
