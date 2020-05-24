def zip(arr1, arr2)
  zipped = []
  arr1.each_index do |i|
    zipped << [arr1[i], arr2[i]]
  end
  zipped
end

zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

flip = Enumerator.new do |y|
  a = 1
  loop do
    y.yield(a)
    a = a > 0 ? (a + 1) * -1 : (a - 1) * -1
  end
end
