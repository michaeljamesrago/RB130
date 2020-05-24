# def reduce(arr, acc=0)
#   for elem in arr
#     acc = yield(acc, elem)
#   end
#   acc
# end
#
# array = [1, 2, 3, 4, 5]
#
# reduce(array) { |acc, num| acc + num }                    # => 15
# reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }
def reduce(arr)
  acc = arr[0]
  counter = 1
  while counter < arr.length
    acc = yield(acc, arr[counter])
    counter += 1
  end
  acc
end
p reduce([2, 4, 6, 8]) { |acc, value| acc + value }
p reduce(['a', 'b', 'c']) { |acc, value| acc + value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
