module ItsAlive
  class HiddenLayer < Layer
    def learn
      @neurons.map(&:learn)
      super
    end
  end
end
