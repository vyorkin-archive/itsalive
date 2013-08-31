module ItsAlive
  class Synapse
    class << self
      def input_to(target) Synapse.new(nil, target) end
      def output_from(source) Synapse.new(source, nil) end

      alias_method :receptor_to, :input_to
    end

    attr_reader :source, :target
    attr_reader :weight, :output

    def initialize(source, target, weight = Randomizer::DEFAULT.call)
      @source, @target = source, target
      @weight = weight
    end

    def signal(val)
      @output = @weight * val
    end

    def adjust(delta)
      @weight += delta
    end
  end
end
