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
    attr_reader :weight, :delta, :output

    def initialize(source, target, weight = nil)
      @learning_rate = Settings.instance.learning_rate
      @momentum = Settings.instance.momentum

      @source, @target = source, target
      @weight = weight || Settings.weight
      @delta, @output = 0, 0
    end

    def signal(val)
      @output = @weight * val
    end

    def adjust
      gradient = @source.output * @target.delta
      @delta = @learning_rate * gradient + @momentum * @delta
      @weight += @delta
    end
  end
end
