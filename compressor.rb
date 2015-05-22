require 'zlib'

class Compressor

  def text 
    path =  File.dirname(__FILE__)
    @url = "#{path}/lib/dictionaries/english"
    File.read(@url)
  end

  def compress

    compressed = Zlib::Deflate.deflate text

    File.open(@url, 'w') do |file|
      file.write compressed 
    end
  end

  def decompress
    decompressed = Zlib::Inflate.inflate text

    File.open(@url, 'w') do |file|
      file.write decompressed 
    end

  end

end

comp = Compressor.new
comp.send(ARGV[0])
