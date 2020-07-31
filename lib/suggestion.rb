class Suggestion

  def initialize word, dictionary
    @word = word
    @dictionary = dictionary
  end

  def search
    format suggestions.take(50)
  end

  def suggestions
    result = []
    (0...5).each do |num|
      result = self.send("try_#{num}", result)
      break if result.count > 5
    end
    result
  end

  def try_0 result
    result | find_by_exp(/(^#{@word}.*)/) |
      find_by_exp(/(^#{@word[0...-1]}.*)/) |
      find_by_exp(/(^#{@word[0...-2]}.*)/)
  end

  def try_1 result
    result | find(@word) | find(@word[0...-1]) | find(@word[0...-2])
  end

  def try_2 result
    result |
    find(@word.reverse[0...-1].reverse) |
      find(@word.reverse[0...-2].reverse) |
      find(@word.reverse[0...-3].reverse)
  end

  def try_3 result
    result | find_by_exp(/(.*#{@word[0...3]}.*?[#{@word[0...-3]}]+.*)/)
  end

  def try_4 result
    result | find_by_exp(/(.*[#{@word[0...3]}].*?#{@word[0...-3]}+.*)/)
  end

  def try_5 result
    result | find_by_exp(/(.*[#{@word}]+.*)/)
  end

  def find word
    @dictionary.join("\n").scan(/(.*#{word}.*)/).flatten
  end

  def find_by_exp exp
    @dictionary.join("\n").scan(exp).flatten
  end

  def format sug_arr
    {word: @word, suggestions: sug_arr}
  end

end
