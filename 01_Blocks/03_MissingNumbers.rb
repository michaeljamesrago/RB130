def missing(arr)
  missing = []
  i = 0
  while i < arr.length - 1
    start = arr[i]
    finish = arr[i + 1]
    if finish - start <= 1
      i += 1
      next
    end
    ((start + 1)...(finish)).each { |num| missing << num }
    i += 1
  end
  missing
end
