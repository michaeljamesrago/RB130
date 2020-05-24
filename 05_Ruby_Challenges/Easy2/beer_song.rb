# class BeerSong has no attributes and two methods
# verse takes one argument, an integer between 0 and 99
#   returns a verse in one format if the number is in 2..99, a second format if
#   the number is 1, and a third format if the number is zero
# lyrics takes no arguments, and returns the concatenated results of calling
#   #verse for numbers 99 through 0
# if the number is 1..99, The second line starts "Take one down and pass it
#   around". If zero, "Go to the store and buy some more."
# The number 0 is represented by the string "no more". It is capitalized at the
#   beginning of a sentence and not in the middle.
# variables: Take one down and pass it around/Go to the store and buy some more
#            bottle/bottles
#            number/(no more/No more)
# number 3..99
#   number
#   Take one down and pass it around
#   bottles - bottles
#   number
# number 2
#   number
#   Take one down and pass it around
#   bottles - bottle
#   number
# number 1
#   number
#   Take one down and pass it around
#   bottle - bottles
#   no more
# number 0
#   No more
#   Go to the store and buy some more
#   bottles - bottles
#   99
# Extract singular or plural bottles to a method that returns "99 bottles"
#   or "1 bottle"
# Extract "Take one down"/"Go to the store" to a method that takes a number arg
#
class BeerSong
  def how_many(num)
    if num > 1
      "#{num} bottles"
    elsif num == 1
      "#{num} bottle"
    elsif num == 0
      "no more bottles"
    elsif num == -1
      "99 bottles"
    end
  end

  def second_line(num)
    if num > 0
      "Take #{one_or_it(num)} down and pass it around"
    else
      "Go to the store and buy some more"
    end
  end

  def one_or_it(num)
    if num == 1
      "it"
    else
      "one"
    end
  end

  def verse(num)
    <<~HEREDOC
      #{how_many(num).capitalize} of beer on the wall, #{how_many(num)} of beer.
      #{second_line(num)}, #{how_many(num - 1)} of beer on the wall.
    HEREDOC
  end

  def verses(from, to)
    (to..from).to_a.reverse.map { |i| verse(i) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

beersong = BeerSong.new
puts beersong.verse(99)
puts beersong.verses(98, 97)
puts beersong.verse(2)
puts beersong.verses(1, 0)
