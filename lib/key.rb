class Key

  attr_reader :alphabet, :random_array
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @random_array = []
  end

  def create_random_number
    5.times {random_array << (0..9).to_a.sample}
  end

end
