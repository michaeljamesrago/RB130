#Use a regex with scan to select all the qualifying words and put them in an
#array.
#Then iterate through the array, reversing every other word.
#Then join the array with " " and end it with a .
# def odd_words(input)
#   words = input.scan(/[A-Aa-z]{1,20}/)
#   words.each_with_index { |word, index| word.reverse! if index.odd? }
#   words.join(" ") + "."
# end
#
# p odd_words('whats the matter with kansas')
# p odd_words('qwertyuiopasdfghjklzxcvbnm')

# iterate through the characters in the string
# while the next character retrieved is not a space, add it to a string
# when a space is encountered, add the word to an array and reset the string to
#   ""
# then join the array with " " and add a "." at the end
def odd_words(input)
  word = ""
  words = []
  input.chars.each_with_index do |chr, i|
    if chr.match?(/[\s]+/) || word.length == 20
      words << word if word.match?(/\A[A-Za-z]{1,20}\z/)
      word = ""
    else
      word << chr
    end
    words << word if i == input.length - 1
  end
  words.each_with_index { |word, i| word.reverse! if i.odd? }.join(" ") + "."
end

p odd_words('whats the matter with kansas')
p odd_words('qwertyuiopasdfghjklzxcvbnm')
