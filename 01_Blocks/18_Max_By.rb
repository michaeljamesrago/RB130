def max_by(arr)
  max = nil
  arr.each do |elem|
    if !max
      max = elem
      next
    end
    next if !elem
    max = yield(elem) > yield(max) ? elem : max
  end
  max
end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
p max_by([nil, nil, 9, 5, nil, 11]) { |value| value + 5 }
