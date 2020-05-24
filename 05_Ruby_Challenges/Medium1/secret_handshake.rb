# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
#
#
# 10000 = Reverse the order of the operations in the secret handshake.
#
# Each digit in the binary string represents an action:
#  19 = 1   0   0   1   1 = wink, double blink
#      REV         DBL WIN
#
#  31 = 1   1   1   1   1 = wink, double blink, close your eyes, jump
#      REV JUM CYE DBL WIN
#
# Input: an integer between 0 and 31, or a string consisting of no more than
#   5 ones or zeroes.
#   - invalid input returns empty array
# Output: an array containing strings representing the above instructions, in
#   an order determined by the input.
#
#  First: get the input into a form we can use
#    If it's a string, validate if it contains only ones and zeroes and is no
#    more than 5 characters in length.
#      If it is less than 5 characters, add leading zeroes to make it 5
#      characters
#    If it's an integer, validate if it's less than 32
#      format it as a binary number with 5 digits
#
#  Next, set a variable reversed to whether the first character of input
#    is "1"
#  Then, iterate through the rest of the characters with index
#    If the character is "1", add to a result array an instruction string
#      retrieved from an array based on the index. If "reversed" is true, add it
#      to the beginning of the array; if not, add it to the end.
COMMANDS = ["jump", "close your eyes", "double blink", "wink"]

class SecretHandshake
  attr_reader :input
  def initialize(inp)
    @input = if inp.class == Integer && inp < 32
               format("%05b", inp)
             elsif inp.class == String && inp.match?(/\A[01]{1,5}\z/)
               "0" * (5 - inp.length) + inp
             else
               "00000"
             end
  end

  def commands
    result = []
    input = (@input + "").chars
    reversed = !!(input.shift == "1")
    input.each_with_index do |digit, i|
      if digit == "1"
        reversed ? result.push(COMMANDS[i]) : result.unshift(COMMANDS[i])
      end
    end
    result
  end
end

# puts SecretHandshake.new(0).input # "00000"
# puts SecretHandshake.new(1).input # "00001"
# puts SecretHandshake.new(2).input # "00010"
# puts SecretHandshake.new(14).input# "01110"
# puts SecretHandshake.new("101").input# "00101"
# puts SecretHandshake.new("102").input# "00000"
# puts SecretHandshake.new(10).commands
# puts SecretHandshake.new(12).commands
# puts SecretHandshake.new(16).commands
# puts SecretHandshake.new(31).commands
# puts SecretHandshake.new(32).commands
# puts SecretHandshake.new("10").commands
# p SecretHandshake.new("100010").commands
