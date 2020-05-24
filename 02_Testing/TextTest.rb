require 'minitest/autorun'
require_relative 'swap_letters'

class TextTest < Minitest::Test
  def setup
    @file = File.new("./sample.txt")
    @lorem = @file.read
    @file.rewind
    @wordcount = @lorem.split.count
  end

  def test_swap
    text = Text.new(@file.read)
    swapped = @lorem.gsub("a", "e")
    assert_equal(swapped, text.swap("a", "e"))
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal(@wordcount, text.word_count)
  end

  def teardown
    @file.close
  end
end
