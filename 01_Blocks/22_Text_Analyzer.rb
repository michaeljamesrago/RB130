class TextAnalyzer
  def process
    file = File.new('sample.txt', 'r')
    yield(file.read)
    file.close
    # file = File.open('sample.txt', 'r') do |f|
    #   yield(f.read)
    # end # File::open automatically closes file after block if block given
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split.size} words" }
# analyzer.process { # your implementation }
# analyzer.process { # your implementation }
