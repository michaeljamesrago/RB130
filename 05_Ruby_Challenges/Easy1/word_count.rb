class Phrase
  def initialize(str)
    @str = str
  end

  def word_count
    words = @str.split(/\'?[^\w\']+\'?/).map(&:downcase)
    hsh = Hash.new(0)
    words.each { |word| hsh[word] += 1 }
    hsh
  end
end
