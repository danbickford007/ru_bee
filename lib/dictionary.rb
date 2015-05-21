class Dictionary

  def initialize options={}
    @options = options
  end

  def self.instance options={}
    @instance ||= new(options)
  end

  def contents
    @contents ||= begin
      filename = @options[:language] || 'english'
      path =  File.dirname(__FILE__)
      file = File.open("#{path}/dictionaries/#{filename}", "r")
      contents = file.read.downcase.split(/\n/)
      file.close
      contents || []
    end
  end

  def check word
    contents.include?(word)
  end

end
