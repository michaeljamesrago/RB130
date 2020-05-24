class Integer
  PLACES = [%w(I V X), %w(X L C), %w(C D M), %w(M)].freeze
  def to_roman
    raise RangeError unless (1..3999).cover?(self)
    roman_numeral = ''
    decimal_digits = digits
    place = 0
    decimal_digits.each do |digit|
      if (1..3).cover?(digit % 5)
        roman_numeral = PLACES[place][0] * (digit % 5) + roman_numeral
        roman_numeral = PLACES[place][1] + roman_numeral if digit > 5
      elsif digit == 5
        roman_numeral = PLACES[place][1] + roman_numeral
      elsif digit == 4
        roman_numeral = "#{PLACES[place][0]}#{PLACES[place][1]}" + roman_numeral
      elsif digit == 9
        roman_numeral = "#{PLACES[place][0]}#{PLACES[place][2]}" + roman_numeral
      end
      place += 1
    end
    roman_numeral
  end
end
