# def compute
#   if block_given?
#     return yield
#   else
#     "Does not compute."
#   end
# end
#
# compute { 5 + 3 } == 8
# compute { 'a' + 'b' } == 'ab'
# compute == 'Does not compute.'
def compute(num = 1)
  return num unless block_given?
  yield(num)
end
