class Key

  attr_reader :alphabet, :random_array, :a_shift, :b_shift, :c_shift, :d_shift
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @random_array = []
    @a_shift = 0
    @b_shift = 0
    @c_shift = 0
    @d_shift = 0
  end

  def create_random_number
    5.times {random_array << (0..9).to_a.sample}
  end

  def make_consecutives(array)
    keys = []
    array.each_cons(2) {|a| keys << a}
    keys
  end

  def date_shift(date)
    (date.to_i ** 2).to_s.split('').last(4)
  end
end
