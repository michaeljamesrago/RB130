def gather(items)
  items = yield(items) if block_given?
  items
end
birds = %w(raven finch hawk eagle)
puts gather(birds) { |_, _, *raptors| raptors }
