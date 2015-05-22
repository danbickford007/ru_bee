require 'zlib'

class Compressor


  def compress
    path =  File.dirname(__FILE__)
    url = "#{path}/lib/dictionaries/english"
    text = File.read(url)

    compressed = Zlib::Deflate.deflate text

    File.open(url, 'w') do |file|
      file.write compressed 
    end
  end

  def decompress
    path =  File.dirname(__FILE__)
    url = "#{path}/lib/dictionaries/english"
    text = File.read(url)

    decompressed = Zlib::Inflate.inflate text

    File.open(url, 'w') do |file|
      file.write decompressed 
    end

  end

end

comp = Compressor.new
comp.send(ARGV[0])
