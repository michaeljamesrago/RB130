class Trinary
  def initialize(value)
    @value = value
  end

  def to_decimal
    return 0 if @value.match?(/[^0-2]/)
    trits = @value.to_i.digits
    trits.each_with_index.map { |elem, ind| 3**ind * elem }.reduce(&:+)
  end
end
