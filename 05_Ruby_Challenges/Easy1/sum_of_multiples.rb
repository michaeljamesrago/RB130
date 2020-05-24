class SumOfMultiples
  def initialize(*factors)
    @factors = factors
    p @factors
  end

  def to(limit)
    multiples = []
    @factors.each do |factor|
      multiplier = 1
      while factor * multiplier < limit
        multiples << factor * multiplier
        multiplier += 1
      end
    end
    result = multiples.uniq.reduce(:+)
    return !!result ? result : 0
  end

  def self.to(limit)
    som = SumOfMultiples.new(3, 5)
    som.to(limit)
  end
end
