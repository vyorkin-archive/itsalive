module ItsAlive
  class Neuron
    attr_reader :dendrites, :axon_synapses
    attr_reader :output, :potential
    attr_accessor :delta

    def initialize(options = {})
      @threshold = options[:threshold] || Defaults::THRESHOLD
      @activation = options[:activation] || Activation::SIGMOID
      reset
    end

    def link_from(source)
      @dendrites << link(source, true)
      self
    end

    def link_to(target)
      @axon_synapses << link(target, false)
      self
    end

    def activate(signals)
      @dendrites.zip(signals) { |d, s| d.signal(s) }
      @potential = @dendrites.map(&:output).inject(&:+)
      @output = @activation.call(@potential + @threshold)
    end

    def reset
      @dendrites = []
      @axon_synapses = []
      @pontential, @output = 0, 0
    end

    private

    def link(node, inbound)
      node.is_a?(Synapse) ? node :
        inbound ?
          Synapse.new(node, self) :
          Synapse.new(self, node)
    end

    alias_method :squash, :activate
  end
end
