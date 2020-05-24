factorializer = Enumerator.new do |y|
  y.yield(1)
  n = 1
  while n < 10
    i = n - 1
    factorial = n
    while i > 0
      factorial *= i
      i -= 1
    end
    y.yield(factorial)
    n += 1
  end
end

def internal_iterator(e, n)
  while n > 0
    yield(e.next)
    n -= 1
  end
end

def get_factorials(e, num)
  num.times { |_| puts e.next } # external iterator
  e.rewind
  internal_iterator(e, num) { |n| puts n }
  e.rewind
  e.each { |num| puts num }
  begin
    str = ""
    7.times { |_| str << e.next.to_s + " " }
    p str
    puts e.next
  rescue StopIteration
    puts $!.result
  end
end

get_factorials(factorializer, 7)




# def factorial(n)
#   i = n - 1
#   while i > 0
#     n *= i
#     i -= 1
#   end
#   n
# end
#
# (0..7).each { |i| puts factorial(i) }
#
# fib = Enumerator.new do |y|
#   a = b = 1
#   loop do
#     y.yield(a)
#     a, b = b, a + b
#   end
# end
