# class DNA is initialized with one string value bases, saved in instance
#   variable @bases
# method DNA#hamming_distance
#   distance = 0
#   takes one string argument `bases_to_compare`
#   length_of_comparison = [@bases.length, bases_to_compare.length].min
#   bases = @bases.slice(0, length_of_comparison)
#   bases_to_compare = bases_to_compare.slice(length_of_comparison)
#   bases.chars.each_with_index do |elem, i|
#     distance += 1 unless elem == bases_to_compare[i]
#   end
#   distance
class DNA
  def initialize(bases)
    @bases = bases
  end

  def hamming_distance(bases_to_compare)
    distance = 0
    length_of_comparison = [@bases.length, bases_to_compare.length].min
    bases = @bases.slice(0, length_of_comparison)
    bases_to_compare = bases_to_compare.slice(0, length_of_comparison)
    bases.chars.each_with_index do |base, i|
      distance += 1 unless base == bases_to_compare[i]
    end
    distance
  end
end
