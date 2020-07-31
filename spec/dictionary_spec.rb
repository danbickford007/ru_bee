require 'dictionary'

describe Dictionary do
  let(:dictionary) { Dictionary.instance {}}

  describe '#contents' do
    it 'should have x amount contents' do
      expect(dictionary.contents.count).to eq(261473)
    end
  end

  describe '.instance' do
    it 'should only have 1 instance' do
      dict = Dictionary.instance
      expect(dictionary.object_id).to eq(dict.object_id)
    end
  end

  describe '#check' do
    it 'should word exists in contents' do
      expect(dictionary.check('test')).to eq(true)
    end
  end
end
