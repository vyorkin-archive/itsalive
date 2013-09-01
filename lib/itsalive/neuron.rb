module ItsAlive
  class Neuron
    include BlockEvaluator

    attr_reader :dendrites, :axon_synapses
    attr_reader :output, :potential
    attr_accessor :delta

    def initialize(&block)
      @threshold = Settings.instance.neuron_threshold
      @activation = Settings.instance.activation_function
      reset
      evaluate(&block)
    end

    def reset
      @dendrites = []
      @axon_synapses = []
      @pontential, @output = 0, 0
    end

    def link_to(target)
      link = Synapse.new(self, target)
      @axon_synapses << link
      target.dendrites << link
      self
    end

    def activate
      @potential = @dendrites.map(&:output).inject(&:+)
      @output = @activation.call(@potential + @threshold)
      @axon_synapses.signal(@output) if @axon_synapses.any?
    end

    alias_method :inputs, :dendrites
    alias_method :outputs, :axon_synapses
    alias_method :connect_to, :link_to
  end
end
