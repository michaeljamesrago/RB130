# Class CircularBuffer
#   Internal classes
#     BufferEmptyException
#     BufferFullException
#   Methods
#     initialize(int) - @debut: 0, @end: 0, @buffer is an array of size int, and
#       @size = int.
#     read - elem = @buffer[@debut]. Throws exception if nil. Otherwise,
#       @debut = increment(@debut) and return elem
#     write(value) - return if value nil. elem = @buffer[@end]. Throws exception
#       unless elem is nil. Else, @buffer[@end] = value, @end = increment(@end)
#     write!(value)
#       calls write(value). If BufferFullException is thrown, rescue
#         @buffer[@end] = value, increment both @debut and @end.
#     clear - all items in @buffer nil, @debut and @end both 0
#     private increment(int) returns int + 1 mod @size
class CircularBuffer
  class BufferEmptyException < RuntimeError
  end

  class BufferFullException < RuntimeError
  end

  def initialize(size)
    @debut = 0
    @fin = 0
    @buffer = Array.new(size)
    @size = size
  end

  def read
    elem = buffer[debut]
    raise BufferEmptyException if elem.nil?
    buffer[debut] = nil
    self.debut = increment(debut)
    elem
  end

  def write(value)
    return if value.nil?
    elem = buffer[fin]
    raise BufferFullException unless elem.nil?
    buffer[fin] = value
    self.fin = increment(fin)
  end

  def write!(value)
    write(value)
  rescue BufferFullException
    buffer[fin] = value
    self.debut = increment(debut)
    self.fin = increment(fin)
  end

  def clear
    buffer.map! { |_| nil }
  end

  private

  attr_accessor :debut, :fin
  attr_reader :buffer, :size

  def increment(i)
    (i + 1) % size
  end
end
