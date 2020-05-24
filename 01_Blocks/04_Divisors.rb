# def divisors(num)
#   divs = (1...((num / 2) + 1)).select { |i| num % i == 0 }
#   divs += [num] unless divs.last == num
# end
# Method takes one argument num
# set i equal to zero
# set return array = []
# loop while i less than or equal to num
#   use the divmod method to get an answer and a remainder for num / i
#   When the remainder is zero, then add i to return array and set num = answer
#   increment i by 1
# return the return array
def divisors(num)
  multiplicands = []
  multipliers = []
  i = 1
  lim = num
  while i < lim
    answer, remainder = num.divmod(i)
    if remainder == 0
      multiplicands << i
      multipliers.unshift(answer) unless i == answer
      lim = answer
    end
    i += 1
  end
  (multiplicands + multipliers)
end
p divisors(100)
p divisors(1024)
p divisors(2048)
p divisors(1025)
p divisors(65535)
p divisors(1234567890)
