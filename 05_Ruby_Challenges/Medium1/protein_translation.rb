# Translation class has two class methods
#   #of_codon
#     Input: a sequence of three uppercase characters in [AUG]
#     Output: a string from a lookup table corresponding to the sequence
#       Raises InvalidCodonError if any invalid characters present in string.
#   #of_rna
#     Input: a sequence of indeterminate length of characters in [AUG]
#       Takes three characters at a time and passes them to of_codon
#       While the result is not STOP, adds result to an array
#       returns array
#
# Questions: Case sensitive? Length of input sequences always divisible by 3?
class Translation
  TRANSLATOR = { AUG:	"Methionine",
                 UUU: "Phenylalanine",
                 UUC: "Phenylalanine",
                 UUA: "Leucine",
                 UUG:	"Leucine",
                 UCU: "Serine",
                 UCC: "Serine",
                 UCA: "Serine",
                 UCG: "Serine",
                 UAU: "Tyrosine",
                 UAC:	"Tyrosine",
                 UGU: "Cysteine",
                 UGC:	"Cysteine",
                 UGG:	"Tryptophan",
                 UAA: "STOP",
                 UAG: "STOP",
                 UGA:	"STOP"}

  def self.of_codon(str)
    amino = TRANSLATOR[str.to_sym]
    raise InvalidCodonError unless !!amino
    amino
  end

  def self.of_rna(str)
    amino_acids = []
    strand = str + ""
    loop do
      break if strand.size < 3
      amino_acid = of_codon(strand.slice!(0,3))
      break if amino_acid == "STOP"
      amino_acids << amino_acid
    end
    amino_acids
  end
end

class InvalidCodonError < RuntimeError
end
