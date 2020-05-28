#Implement all parts of this assignment within (this) module2_assignment2.rb file

class LineAnalyzer

  attr_accessor :content, :line_number, :highest_wf_words, :highest_wf_count

  def initialize (content, line_number)
    self.content = content
    self.line_number = line_number

    calculate_word_frequency(self.content)
  end

  def calculate_word_frequency (content)
    counts = Hash.new(0)
    content.downcase.split(" ").each { |content| counts[content] += 1 }
    self.highest_wf_count = counts.values.max
    self.highest_wf_words = counts.map{ |k,v| v == highest_wf_count ? k : nil }.compact
  end

end

class Solution

  attr_accessor :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
  def initialize()
    self.analyzers = Array.new()
  end

  def analyze_file()
    File.foreach("test.txt").with_index do |line, line_num|
      self.analyzers << LineAnalyzer.new(line, line_num)
   end
  end

  def calculate_line_with_highest_frequency()
    self.highest_count_across_lines = 0
    self.analyzers.each do |line|
      if line.highest_wf_count > self.highest_count_across_lines
        self.highest_count_across_lines = line.highest_wf_count
      end
    end
    
    self.highest_count_words_across_lines = Array.new()
    self.analyzers.each do |line|
      if line.highest_wf_count == self.highest_count_across_lines
        self.highest_count_words_across_lines << line
      end
    end
  end

  def print_highest_word_frequency_across_lines()
    puts "The following words have the highest word frequency per line:"
    self.analyzers.each do |line|
      puts "#{line.highest_wf_words} (appears in line #{line.line_number})"
    end
  end

end