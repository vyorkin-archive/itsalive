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

    def signal(values)
      @dendrites.zip(values) { |dendrite, value|
        dendrite.signal(value)
      }
      self
    end

    def activate
      @potential = @dendrites.map(&:output).inject(&:+)
      @output = @activation.call(@potential + @threshold)
      propagate

      @output
    end

    def output_values
      @axon_synapses.map(&:output)
    end

    private

    def propagate
      if @axon_synapses.any?
        @axon_synapses.each { |synapse|
          synapse.signal(@output)
        }
      end
    end

    alias_method :inputs, :dendrites
    alias_method :outputs, :axon_synapses
    alias_method :connect_to, :link_to
  end
end
