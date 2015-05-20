require 'scanner'

describe String do

  let(:test_string_good) { "This is a test string. It doesn't have 123 any issues." }
  let(:test_string_bad) { "This is a test string. But it conaens a bad word." }


  describe '#correct?' do

    it 'should return true with correct word' do
      expect(test_string_good.correct?).to eq(true)
    end

    it 'should return false with incorrect word' do
      expect(test_string_bad.correct?).to eq(false)
    end

  end

  describe '#get_parts' do

    it 'should break string into word parts' do
      expect(test_string_good.send('get_parts').count).to eq(10)
    end

  end

  describe '#load_dictionary' do

    it 'should set DICTIONARY to' do
      test_string_good.correct?
      expect(test_string_good.send('load_dictionary').count).to eq(235886)
    end

  end

end
