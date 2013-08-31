module ItsAlive
  class Synapse
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
