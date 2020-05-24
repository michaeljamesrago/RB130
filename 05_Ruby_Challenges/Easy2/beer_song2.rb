class Verse
  def text
    <<~HEREDOC
    #{num.to_s.capitalize} #{sn_pl} of beer on the wall, #{num} #{sn_pl} of beer.
    #{second_line}
    HEREDOC
  end

  private

  attr_reader :num

  def sn_pl
    "bottles"
  end

  def second_line
    "Take one down and pass it around, #{num - 1} #{sn_pl} of beer on the wall."
  end
end

class ManyBottles < Verse
  def initialize(num)
    @num = num
  end
end

class TwoBottles < Verse
  def initialize
    @num = 2
  end

  private

  def second_line
    "Take one down and pass it around, #{num - 1} bottle of beer on the wall."
  end
end

class OneBottle < Verse
  def initialize
    @num = 1
  end

  private

  def sn_pl
    "bottle"
  end

  def second_line
    "Take it down and pass it around, no more bottles of beer on the wall."
  end
end

class NoBottles < Verse
  def num
    "no more"
  end

  private

  def second_line
    "Go to the store and buy some more, 99 bottles of beer on the wall."
  end
end

class BeerSong2
  def initialize
    @verses = [NoBottles.new, OneBottle.new, TwoBottles.new]
    3.upto(99) do |i|
      @verses << ManyBottles.new(i)
    end
  end

  def verse(num)
    @verses[num].text
  end

  def verses(from, to)
    @verses[to..from].reverse.map { |v| v.text }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end
