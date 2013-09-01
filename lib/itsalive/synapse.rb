module ItsAlive
  class Synapse
    class << self
      def input_to(target, weight = nil)
        Synapse.new(nil, target, weight)
      end

      def output_from(source, weight = 1.0)
        Synapse.new(source, nil, weight)
      end

      alias_method :receptor_to, :input_to
    end

    attr_reader :source, :target
    attr_reader :weight, :output

    def initialize(source, target, weight = nil)
      @source, @target = source, target
      @weight = weight || Settings.instance.random
    end

    def signal(val)
      @output = @weight * val
    end

    def adjust(delta)
      @weight += delta
    end
  end
end
