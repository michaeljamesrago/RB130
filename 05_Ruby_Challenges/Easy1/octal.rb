class Octal
  def initialize(value)
    @value = value
  end

  def to_decimal
    return 0 if @value.match(/[^0-7]/)
    dig = @value.to_i.digits
    acc = 0
    dig.each_with_index do |elem, index|
      acc += elem * (8 ** index)
    end
    acc
  end
end

def to_octal(int)
  result = []
  dividend = int
  loop do
    quotient, remainder = dividend.divmod(8)
    if quotient >= 8
      result << remainder
      dividend = quotient
    else
      result.concat([remainder, quotient])
      break
    end
  end
  result.reverse.join.to_i
end
