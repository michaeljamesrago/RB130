class Series
  def initialize(str)
    @arr = str.chars.map(&:to_i)
  end

  def slices2(i)
    raise ArgumentError unless i <= @arr.length
    @arr.each_cons(i).to_a
  end

  def slices(i)
    result = []
    raise ArgumentError unless i <= @arr.length
    @arr.each_with_index do |elem, index|
      break if index + i > @arr.length
      result << @arr.slice(index, i)
    end
    result
  end
end
