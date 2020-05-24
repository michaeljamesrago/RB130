class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError.new "Can only add Todo objects" unless todo.class == Todo
    @todos << todo
    self
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all{ |todo| todo.done? }
  end

  def item_at(i)
    @todos.fetch(i)
  end

  def mark_done_at(i)
    @todos.fetch(i).done!
  end

  def mark_undone_at(i)
    @todos.fetch(i).undone!
  end

  def done!
    @todos.each{ |todo| todo.done! }
  end

  def undone!
    @todos.each{ |todo| todo.undone! }
  end

  def remove_at(i)
    @todos.delete(@todos.fetch(i))
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def to_s
    @todos.reduce("") { |acc, elem| acc + "#{elem}\n" }
  end

  def each
    for todo in @todos
      yield(todo)
    end
    self
  end

  def select
    new_todo_list = TodoList.new("untitled")
    each { |todo| new_todo_list << todo if yield(todo) }
    new_todo_list
  end

  def find
    @todos.find { |todo| yield(todo) }
  end

  def find_by_title(title)
    find { |todo| todo.title == title }
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_undone
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    done_task = find_by_title(title)
    done_task.done! if done_task
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Code Program")
todo5 = Todo.new("Harvest Honey")
todo6 = Todo.new("Tend Garden")
todo7 = Todo.new("Get Eggs From Henhouse")
todo8 = Todo.new("Check Mushrooms")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
list.add(todo4)
list.add(todo5)
list.add(todo6)
list.add(todo7)
list.add(todo8)
list.mark_done_at(5)
list.mark_done_at(7)
list.mark_done_at(4)
list.mark_done("Go to gym")
puts list, ""
puts list.find_by_title("Clean room"), ""
puts list.all_done, ""
puts list.all_undone, ""
list.mark_all_done
puts list, ""
list.mark_all_undone
puts list, ""
