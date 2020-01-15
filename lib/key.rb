class Key

  attr_reader :alphabet, :digits_array, :a_shift, :b_shift, :c_shift, :d_shift, :date, :key_digits
  def initialize(key_digits = 0, date = 0)
    @alphabet = ("a".."z").to_a << " "
    @digits_array = []
    self.key_initialization(key_digits)
    self.date_initialization(date)
    @a_shift = 0
    @b_shift = 0
    @c_shift = 0
    @d_shift = 0
  end

  def date_initialization(date)
    if date == 0
      time = Time.new.strftime("%d%m%Y")
      time_array = time.split''
      time_array.delete_at(4)
      time_array.delete_at(4)
      @date = time_array.join
    elsif (key_digits.split'').length == 6
      @date = key_digits
    else
      @date = date
    end
  end

  def key_initialization(key_digits)
    if key_digits == 0
      self.create_random_number
      @key_digits = @digits_array.join
    elsif (key_digits.split'').length == 5
      @key_digits = key_digits
      self.translate_key_digits
    else
      self.create_random_number
    end
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
    (@key_digits.split'').each {|digit| @digits_array << digit.to_i}
  end
end
