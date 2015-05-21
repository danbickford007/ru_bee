class Suggestion

  def initialize word, dictionary
    @word = word
    @dictionary = dictionary
  end 

  def search
    format suggestions.take(50)
  end

  def suggestions
    result = try_1 
    if result.count < 1
      result = try_2
      if try_2.count > 0
        result = try_3
      end
    end
    result
  end

  def try_1
    find(@word) | find(@word[0...-1]) | find(@word[0...-2])
  end

  def try_2
    find(@word.reverse[0...-1].reverse) | 
      find(@word.reverse[0...-2].reverse) | 
      find(@word.reverse[0...-3].reverse)
  end

  def try_3
    parts = @word.chars.to_a.join('')
    @dictionary.join("\n").scan(/(.*[#{parts}]+.*)/).flatten
  end

  def find word
    @dictionary.join("\n").scan(/(.*#{word}.*)/).flatten
  end

  def format sug_arr
    {word: @word, suggestions: sug_arr}
  end

end
