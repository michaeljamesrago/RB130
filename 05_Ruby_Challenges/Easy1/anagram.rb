# Write a program that, given a word and a list of possible anagrams, selects
# the correct sublist that contains the anagrams of the word.
#
# For example, given the word "listen" and a list of candidates like "enlists"
# "google" "inlets" "banana" the program should return a list containing
# "inlets". Please read the test suite for exact rules of anagrams.
#
# Anagram object is initialized with one string value @word
# `match` method takes an array argument, and returns an new array with all the
# elements from the argument array that are anagrams of @word
# If there are no anagrams, `match` returns an empty array.
# Anagrams must contain all letters of @word the exact same number of times.
# identical words do not count as anagram.
# Anagram matches are case insensitive
#  `is_anagram?` method
#    takes string str, compares to @word, returns true if anagram, false if not
#      clones both values into local variables word and anagram, downcased
#      return false if anagram.length != word.length, or if anagram == word
#      for each character in word
#        return false unless word.count(character) == anagram.count(character)
#  (If the words are the same length, and the character count for each
#   character is the same for both, the words are anagrams)
#  `match` method
#  select all members of the argument array for which is_anagram? returns true
class Anagram
  def initialize(str)
    @word = str
  end

  def match(possible_anagrams)
    possible_anagrams.select { |word| is_anagram?(word) }
  end

  private

  def is_anagram?(str)
    word, anagram = @word.downcase, str.downcase
    return false if anagram.length != word.length || anagram == word
    for char in word.chars.uniq
      return false unless word.count(char) == anagram.count(char)
    end
    true
  end
end
