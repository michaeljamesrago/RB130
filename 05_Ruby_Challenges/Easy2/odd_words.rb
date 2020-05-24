# Input:
#   -a string of characters consisting of letters, spaces, and one point
#   -contains "words", sequences of non-space characters
#   -"words" are separated by one or more spaces
#   -point character "." comes at the end of the sequence
# Output:
#   -a string of characters containing all the "words" in the input, in order
#   -every odd-indexed word is reversed
#   -words are separated by one space
#   -string ends with a "."
#
# odd_words method takes one argument `input`
# output = []
# iterate through the characters of `input`
#   word = ""
#   if character is a space or a point
#     if word is not an empty string, add word to output
#     word = ""
#   elsif character is a letter
#     add character to word
#  output.join(" ") + "."
def odd_words(input)
  output = ""
  word = ""
  backwards = false
  input.chars.each do |char|
    if char.match?(/[ .]/)
      next if word.empty?
      output << word + char
      backwards = !backwards
      word = ""
    elsif char.match?(/[A-Za-z]/)
      backwards ? word = char + word : word = word + char
    end
  end
  output
end

puts odd_words("")
puts odd_words(".")
puts odd_words("h.")
puts odd_words("hello.")
puts odd_words("hello world.")
puts odd_words("hello world reggae.")
puts odd_words("hello   world reggae.")
puts odd_words("hello world reggae   .")
