def meth(param)
  puts "Method called with object as argument: param = #{param}"
end

class Integer
  def meth
    puts "Method called with object as receiver."
  end
end

m = method(:meth)

pro = m.to_proc

[1, 2, 3].each(&pro)
[1, 2, 3].each(&:meth)

# pr2 = Proc.new { |n| n.to_s }
# p pr2
#
# pr3 = Proc.new { |n| meth(n) }
#
# p [1, 2, 3].map(&pr1)
# p [1, 2, 3].map(&pr2)
# p [1, 2, 3].map(&pr3)
#
# p [1, 2, 3].map { |n| n.to_s }
# p [1, 2, 3].map { |n| meth(n) }
#
# p [1, 2, 3].map(&:to_s)
# p [1, 2, 3].map(&m)
#
# [1, 2, 3].each(&m)
# [4, 5, 6].each(&:meth)

# def meth(param)
#   puts "param=#{param}; self = #{self}"
# end
#
# m = method(:meth).to_proc
#
# class BlockExecutor
#   def initialize
#     @rora = ReceiverOrArgument.new
#   end
#
#   def execute_block(&block)
#     block.call(@rora)
#   end
# end
#
# class ReceiverOrArgument
#   def execute_block
#     yield
#   end
# end
#
# block_executor = BlockExecutor.new
#
# block_executor.execute_block(&m)
# block_executor.execute_block(&:meth)
