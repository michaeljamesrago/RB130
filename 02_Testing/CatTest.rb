require 'minitest/autorun'
require_relative 'cat.rb'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty', 4)
  end

  def test_is_cat; end

  def test_name; end

  def test_miaow
    # assert(@kitty.miaow.include?(' is miaowing.'))
    #assert_match(/ is miaowing\./, @kitty.miaow)
    # assert_equal(' is miaowing.', @kitty.miaow)
    #assert_match(@kitty.miaow, / is miaowing\./)
  end

  def test_is_not_purrier
    patch = Cat.new('Patch', 5)
    milo = Cat.new('Milo', 3)

    refute(patch.purr_factor > milo.purr_factor)
  end
end
