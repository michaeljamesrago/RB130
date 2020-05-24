def drop_while(arr)
  arr = arr.clone
  while !arr.empty?
    break unless yield(arr[0])
    arr.shift
  end
  arr  
end

#p drop_while([2, 4, 6, 7, 8, 9]) { |elem| elem.even? }
p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
