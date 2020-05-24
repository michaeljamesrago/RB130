require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    @todos.each(&:done!)
    assert_equal(true, @list.done?)
    @todos[0].undone!
    assert_equal(false, @list.done?)
  end

  def test_add_type_checker
    assert_raises(TypeError) { @list.add("Not a Todo") }
  end

  def test_add
    todo4 = Todo.new("Watch videos")
    @list.add(todo4)
    assert_equal([@todo1, @todo2, @todo3, todo4], @list.to_a)
  end

  def test_shovel
    todo4 = Todo.new("Watch videos")
    @list << todo4
    assert_equal([@todo1, @todo2, @todo3, todo4], @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(3) }
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(3) }
    @list.mark_done_at(1)
    assert_equal(true, @list.item_at(1).done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(3) }
    @todos.each(&:done!)
    @list.mark_undone_at(1)
    assert_equal(false, @list.item_at(1).done?)
  end

  def test_done!
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_equal(@todo1, @list.remove_at(0))
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    @list.mark_done_at(0)
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.done!
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each
    return_value = @list.each do |todo|
      assert_instance_of(Todo, todo)
    end
    assert_equal(return_value, @list)
  end

  def test_select
    @list.mark_done_at(0)
    @list.mark_done_at(2)
    new_list = @list.select(&:done?)
    assert_equal(new_list.first, @list.first)
    assert_equal(new_list.last, @list.item_at(2))
  end

  def test_find_by_title
    assert_equal(@list.find_by_title("Clean room"), @todo2)
    assert_nil(@list.find_by_title("Rake Leaves"))
  end
end
