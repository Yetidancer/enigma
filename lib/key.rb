class Key

  attr_accessor :alphabet, :random_array, :a_shift, :b_shift, :c_shift, :d_shift, :date
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @random_array = []
    @a_shift = 0
    @b_shift = 0
    @c_shift = 0
    @d_shift = 0
    @date = nil
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

  def letter_shift(position)
    make_consecutives(@random_array)[position].join.to_i + date_shift(@date)[position].to_i
  end

  def letter_shift_a
    @a_shift = letter_shift(0)
  end

  def letter_shift_b
    @b_shift = letter_shift(1)
  end

  def letter_shift_c
    @c_shift = letter_shift(2)
  end

  def letter_shift_d
    @d_shift = letter_shift(3)
  end
end
