module ItsAlive
  class Network
    attr_reader :error

    def initialize(structure, options = {})
      @learning_rate = options[:learning_rate] || Defaults::LEARNING_RATE
      @momentum = options[:momentum] || Defaults::MOMENTUM

      setup(structure)
    end

    private

    def setup(structure)

    end

    def reset
      @error = 1
    end
  end
end
