class Suggestion

  def initialize word, dictionary
    @word = word
    @dictionary = dictionary
  end 

  def search
    format suggestions.take(50)
  end

  def suggestions
    @dictionary.join("\n").scan(/(.*#{@word}.*)/).flatten | 
      @dictionary.join("\n").scan(/(.*#{@word[0...-1]}.*)/).flatten |
      @dictionary.join("\n").scan(/(.*#{@word[0...-2]}.*)/).flatten
  end

  def format sug_arr
    {word: @word, suggestions: sug_arr}
  end

end
