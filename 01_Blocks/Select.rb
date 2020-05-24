def select(arr)
  selected = []
  for elem in arr
    selected << elem if yield(elem)
  end
  selected
end

p select([1, 2, 3, 4, 5, 6, 7, 8]) { |elem| elem.odd? }
