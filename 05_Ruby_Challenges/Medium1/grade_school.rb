# class School has the following methods:
#   add(name, level) - gets sub-array with grade_data(level), adds `name` to it
#   to_h - uses Array#each_with_object({}) method on @school, and for each
#     sub-array, takes sub-array[0] and adds it as a key to obj, and a value of
#     grade(sub-array[0])
#   grade(level) - gets sub-array with grade_data(level), clones it, takes
#     elements 1..-1, sorts them and returns it as a new array.
#   grade_data(grade) - uses Array.assoc(grade) on @school to get relevant
#     sub-array
# class School has the following data structures:
#   @school - an array of arrays. Each sub-array has an integer representing
#     grade level as the first element, and the remaining elements are strings
#     representing names of students.
# class School
#   def initialize
#     @school = []
#   end
#
#   def add(name, level)
#     gd = grade_data(level)
#     if !!gd
#       gd.push(name)
#     else
#       school.push([level])
#       add(name, level)
#     end
#   end
#
#   def to_h
#     school_sorted = school.sort_by { |sub_arr| sub_arr[0] }
#     school_sorted.each_with_object({}) do |sub_array, obj|
#       grade_clone = sub_array.clone
#       lvl = grade_clone.shift
#       obj[lvl] = grade_clone.sort
#     end
#   end
#
#   def grade(level)
#     grd = grade_data(level)
#     return [] if grd.nil?
#     grd[1..-1].sort
#   end
#
#   private
#   attr_reader :school
#
#   def grade_data(level)
#     school.assoc(level)
#   end
# end

class School
  attr_reader :roster

  def initialize
    @roster = Hash.new { |roster, grade| roster[grade] = [] }
  end

  def add(student, grade)
    roster[grade] << student
  end

  def grade(num)
    roster[num]
  end

  def to_h
    roster.sort.map { |grade, list| [grade, list.sort] }.to_h
  end
end
