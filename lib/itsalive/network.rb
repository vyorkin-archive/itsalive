module ItsAlive
  class Network
    attr_accessor :learning_rate, :momentum

    def initialize(structure, options = {})
      @learning_rate = options[:learning_rate] || Defaults::LEARNING_RATE
      @momentum = options[:momentum] || Defaults::MOMENTUM

      setup(structure)
    end

    private

    def setup(structure)
      
    end
  end
end
