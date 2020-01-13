class Key

  attr_accessor :alphabet, :digits_array, :a_shift, :b_shift, :c_shift, :d_shift, :date, :key_digits
  def initialize(key_digits = 0)
    @alphabet = ("a".."z").to_a << " "
    @key_digits = key_digits
    @digits_array =
      if key_digits == 0
        self.create_random_number
      else
        self.translate_key_digits
      end
    @a_shift = 0
    @b_shift = 0
    @c_shift = 0
    @d_shift = 0
    @date = nil
  end

  def create_random_number
    5.times {@digits_array << (0..9).to_a.sample}
  end

  def make_consecutives(array)
    keys = []
    array.each_cons(2) {|a| keys << a}
    keys
  end

  def date_shift(date)
    (date.to_i ** 2).to_s.split('').last(4)
  end

  def helper_shift(position)
    make_consecutives(@digits_array)[position].join.to_i + date_shift(@date)[position].to_i
  end

  def letter_shift
    @a_shift = helper_shift(0)
    @b_shift = helper_shift(1)
    @c_shift = helper_shift(2)
    @d_shift = helper_shift(3)
  end

  def translate_key_digits
    split_digits = []
    (@key_digits.to_s.split'').each {|digit| split_digits << digit.to_i}
    split_digits
  end
end
