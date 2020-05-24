class Sieve
  def initialize(size)
    @top_of_range = size
  end

  def primes
    numbers = {}
    (2..@top_of_range).each { |i| numbers[i] = false }

    (2..@top_of_range).each do |number|
      next if numbers[number]
      multiple = number
      while number * multiple <= @top_of_range
        key = number * multiple
        numbers[key] = true
        multiple += 1
      end
    end
    numbers.keys.select { |key| !numbers[key] }
  end

  def primes2
    primes = []
    numbers = (2..@top_of_range).to_a
    until numbers.empty?
      next_element = numbers.shift
      numbers.reject! { |number| number % next_element == 0 }
      primes << next_element
    end
    primes
  end
end
