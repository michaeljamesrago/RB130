items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  x = block_given? ? yield(items) : "#{items.join(', ')}"
  puts x
  puts "Nice selection of food we have gathered!"
end
gather(items)
puts ""
gather(items) do |things|
  str = ""
  things.each_with_index do |el, i|
    str << "#{i} #{el}\n"
  end
  str
end
