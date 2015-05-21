require 'suggestion'
require 'dictionary'

class String 

  def correct? options={}
    @options = options
    check
  end

  def misspellings options={}
    @options = options
    check({collect: true, suggestions: @options[:suggestions]})
    @bad_words
  end

  private

  def words
    @words ||= self.downcase.gsub(/[\'\"]/, '').scan(/[a-z]+/)
  end

  def remove_s word
    if word[-1] == 's'
      return word[0...-1] 
    end 
    word
  end

  def remove_ed(word)
    if word[-1] == 'd' and word[-2] == 'e' 
      return word[0...-2] 
    end 
    word
  end

  def remove_es(word)
    if word[-1] == 's' and word[-2] == 'e' 
      return word[0...-2] 
    end 
    word
  end

  def remove_ing(word)
    if word[-1] == 'g' and word[-2] == 'n' and word[-3] == 'i' 
      return word[0...-3] 
    end 
    word
  end

  def check opts={}
    dictionary = Dictionary.instance @options
    @bad_words = []
    words.each do |word|
      unless dictionary.check("#{word}") or
        dictionary.check("#{remove_s(word)}") or
        dictionary.check("#{remove_ed(word)}") or
        dictionary.check("#{remove_ing(word)}") or
        dictionary.check("#{remove_es(word)}")
        @bad_words << (opts[:suggestions] ? (Suggestion.new(word, dictionary.contents).search) : word)
        return false unless opts[:collect]
      end
    end
    true
  end

end
