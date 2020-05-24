# Starting with basic skeleton for the Luhn class
# Class `Luhn` is initialized with one argument `@series`
#   an array of digits starting with the rightmost
# addends passes @series to class method addends
# self.addends iterates through series and returns a new array with odd-indexed
#   digits replaced with doubled, and if doubled is greater than 9,
#   doubled - 9 .reverse
# checksum takes the total of addends
# valid? is the truth value of checksum % 10 == 0
# create - class method
#   takes one argument, int
#   multiplies int by 10 to put a zero on the end of it
#   get addends with Luhn.addends(int.digits)
#   reduce addends to sum
#   add 10 - (sum % 10) to int unless (sum % 10) == 0
#   return int
class Luhn
  def initialize(int)
    @series = int.digits
  end

  def addends
    Luhn.addends(@series)
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    !!(checksum % 10 == 0)
  end

  def self.addends(series)
    result = []
    series.clone.each_with_index do |addend, index|
      if index.even?
        result << addend
      else
        modified_addend = addend * 2
        modified_addend -= 9 if modified_addend >= 10
        result << modified_addend
      end
    end
    result.reverse
  end

  def self.create2(int)
    int *= 10
    addends = Luhn.addends(int.digits)
    sum = addends.reduce(:+)
    remainder = sum % 10
    int += (10 - remainder) unless remainder == 0
    int
  end

  def self.create(int)     ## Using newly instantiated Luhn object
    int *= 10              ## This would eliminate the need for Luhn::addends.
    luhn = Luhn.new(int)   ## Luhn#addends would contain the code that produced
    sum = luhn.checksum    ## the addends array, instead of calling the class
    remainder = sum % 10   ## method.
    int += (10 - remainder) unless remainder == 0
    int
  end
end
