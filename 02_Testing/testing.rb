require 'stringio'
class InputGetter
  def get_input(input: $stdin)
    puts "Enter your name:"
    name = input.gets.chomp
    puts "Your name is #{name}."
  end
end

input_getter = InputGetter.new
input = StringIO.new("Richard\n")
input_getter.get_input(input: input)
