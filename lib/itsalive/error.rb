module ItsAlive
  module Error
    SIGNAL = -> (desired, actual) { desired - actual }
    ENERGY = -> (signal) { 0.5 * (signal ** 2) }

    SUM = -> (energies) {
      0.5 * energies.inject(&:+)
    }
    MEAN = -> (energies) {
      1/energies.length * energies.inject(&:+)
    }
    ROOT_MEAN = -> (energies) {
      Math.sqrt(MEAN(energies))
    }
  end
end
