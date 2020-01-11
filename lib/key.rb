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

  def letter_shift_a
    @a_shift = make_consecutives(@random_array)[0].join.to_i + date_shift(@date)[0].to_i
  end

  def letter_shift_b
    @b_shift = 32
    @b_shift = make_consecutives(@random_array)[1].join.to_i + date_shift(@date)[1].to_i
  end

  def letter_shift_c
    @c_shift = 38
    @c_shift = make_consecutives(@random_array)[2].join.to_i + date_shift(@date)[2].to_i
  end

  def letter_shift_d
    @d_shift = 49
    @d_shift = make_consecutives(@random_array)[3].join.to_i + date_shift(@date)[3].to_i
  end
end
