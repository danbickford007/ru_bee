class String 

  @dictionary = [] 

  def correct? options={}
    @options = options
    get_parts
    load_dictionary
    check
  end

  def get_parts 
    @parts = self.downcase.gsub(/[\'\"]/, '').scan(/[a-z]+/)
  end

  def load_dictionary
    filename = @options[:language] || 'english'
    file = File.open("lib/#{filename}", "r")
    @dictionary = file.read.downcase.split(/\n/)
    file.close 
    @dictionary
  end

  def check
    @parts.each do |word|
      unless @dictionary.include?("#{word}") or @dictionary.include?("#{word[0...-1]}")
        return false 
      end
    end 
    true
  end


end
