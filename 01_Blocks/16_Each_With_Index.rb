def each_with_index(arr)
  for i in (0...arr.length)
    yield(arr[i], i)
  end
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
