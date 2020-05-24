items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*var1, var2|
  puts var1.join(", ")
  puts var2
end

gather(items) do |var1, *var2, var3|
  puts var1
  puts var2.join(", ")
  puts var3
end

gather(items) do |var1, *var2|
  puts var1
  puts var2.join(", ")
end

gather(items) do |*var1, var2|
  puts var1.join(", ") + " and #{var2}"
end
