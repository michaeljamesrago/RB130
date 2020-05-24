# class PigLatin has one class method `translate`
#   takes one argument, a string consisting of a series of lowercase (?)
#   letters and spaces words are separated by one (?) space.
#   for each word, `translate` takes a pattern of zero or more letters from
#   the beginning of the word and appends it to the end of the word, appending
#   'ay' to the resulting string. returns the altered words in a string with
#   one space between them.
#
#  Pattern rules:
#    word starts with a vowel, yt, or xr
#      pattern consists of zero characters (apple => appleay)
#    word starts with one or more consonants (the pattern 'qu' counts as a
#    consonant)
#      pattern consists of all the consonants at the beginning of the word.
#
#  Steps:
#    split input string with " " into `words` array
#    `ordsway` is the words array mapped with a block that transforms each
#      word based on the above rules
#     method returns ordsway joined on " "
class PigLatin
  def self.translate(str)
    words = str.split(" ")
    ordsway = words.map { |word| trans(word) }
    ordsway.join(" ")
  end

  def self.trans(word)
    appleay = word.match(/^([aeiou]+|[xy][^aeiou])([a-z]*)/)
    irrelsquay = word.match(/^([^aeiou]*qu|[^aeiou]+)([a-z]+)*/)
    if appleay
      appleay[1] + appleay[2] + "ay"
    elsif irrelsquay
      irrelsquay[2] + irrelsquay[1] + "ay"
    end
  end
end
