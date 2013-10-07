module ItsAlive
  class HiddenLayer < Layer
    def learn
      @neurons.map(&:learn)
      @previous.learn if @previous
    end
  end
end
