module ItsAlive
  class Network
    attr_reader :error

    def initialize(structure, options = {})
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
