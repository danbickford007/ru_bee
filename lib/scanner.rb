class String 

  def correct? options={}
    @options = options
    check
  end

  private

  def words
    @words ||= self.downcase.gsub(/[\'\"]/, '').scan(/[a-z]+/)
  end

  def dictionary
    @dictionary ||= begin
      filename = @options[:language] || 'english'
      path =  File.dirname(__FILE__)
      file = File.open("#{path}/dictionaries/#{filename}", "r")
      contents = file.read.downcase.split(/\n/)
      file.close
      contents || []
    end
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

  def check
    words.each do |word|
      unless dictionary.include?("#{word}") or
        dictionary.include?("#{remove_s(word)}") or
        dictionary.include?("#{remove_ed(word)}") or
        dictionary.include?("#{remove_ing(word)}") or
        dictionary.include?("#{remove_es(word)}")
        return false
      end
    end
    true
  end

end
