def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end

def none?(collection, &block)
  !any?(collection, &block)
end

puts none?([1, 3, 5, 6]) { |value| value.even? } == false
puts none?([1, 3, 5, 7]) { |value| value.even? } == true
puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none?([1, 3, 5, 7]) { |value| true } == false
puts none?([1, 3, 5, 7]) { |value| false } == true
puts none?([]) { |value| true } == true

def no_block(num)
  puts num
  yield if block_given?
end

def block_required(num, &block)
  puts num
  yield if block_given?
  block.call if block_given?
end

def proc_required(num, proc)
  puts num
  proc.call
end
#I If you don't put &block in the parameter list when you're defining a method,
#and a block is passed in at method invocation:
#1. `yield` will execute the code in the block

#II If you put &block in the parameter list when you're defining a method, and a
#block is passed in at method invocation:
#1. the block is converted to a Proc object with to_Proc
#2. the Proc object is given a handle `block`
#3. the Proc can be called using `block.call` or `yield`
#4. the Proc can be passed as an argument to another method using its handle

#III If you put &block in the parameter list when you're defining a method, and
#no block is passed in at method invocation:
#1. there will be no ArgumentError
#2. yield will raise a LocalJumpError
#3. block.call will raise a NoMethodError (`call' for NilClass) (block == nil)

#IV If you invoke a method and pass in `&block` as the last argument:
#1. it will raise an error unless `block` is a Proc object in scope
#2. it will not count against the argument list in the method definition, so it
#   cannot cause an ArgumentError
#3. Does the method have `&block` in its parameter list?
#     yes: the method will call to_proc on the argument, and since it is already
#          a Proc, it will return itself. Then see II.2.
#     no: the method will treat it as an unnamed block, so it will be executed
#          only if there is a `yield` in the method definition (see I)
#


no_block(1)
block_required(2)
no_block(3) { puts 4 }
block_required(5) { puts 6 }
block = Proc.new { puts 9 }
no_block(7, &block)
block_required(8, &block)
proc_required(10, block)
