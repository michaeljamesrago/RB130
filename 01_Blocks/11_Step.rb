def step(start, finish, step_value)
  i = start
  while i <= finish
    yield(i)
    i += step_value
  end
end

step(1, 23, 3) { |i| puts "value: #{i}"}
