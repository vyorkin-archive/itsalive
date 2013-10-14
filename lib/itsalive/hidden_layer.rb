module ItsAlive
  class HiddenLayer < Layer
    def initialize(size)
      super(Array.new(size) { InterriorNeuron.new })
    end

    def learn
      @neurons.map(&:learn)
      super
    end
  end
end
