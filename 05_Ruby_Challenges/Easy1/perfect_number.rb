#PerfectNumber class contains one class method `classify`
#`classify` takes one argument num
# Raises RuntimeError if num < 1
# divisors is an array containing all the positive divisors of num
# use divisors.reduce to sum up divisors and compare result to num
# return the string 'deficient', 'perfect', or 'abundant'
class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 1
    divisors = (1..(num - 1)).to_a.select { |n| num % n == 0 }
    sum_of_divisors = divisors.reduce(:+)
    result = case
    when sum_of_divisors < num
      'deficient'
    when sum_of_divisors > num
      'abundant'
    else
      'perfect'
    end
    result
  end
end
