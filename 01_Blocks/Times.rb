# class Integer
#   def my_times
#     for i in (0...self)
#       yield(i)
#     end
#     self
#   end
# end
#
# 3.my_times{ |num| puts num }
# 3.times{ |num| puts num }

def times(number)
  counter = 0
  while counter < number
    yield(counter)
    counter += 1
  end
  number
end

times(7) { |num| puts num }

def each(arr)
  for elem in arr
    yield(elem)
  end
  arr
end

each([2, 3, "potato", :six, 3.14159]) { |elem| puts elem }
