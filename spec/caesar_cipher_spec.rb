require './lib/caesar'

describe '#caesar_cipher' do
  it 'returns the word shifted by the shift factor' do
    expect(caesar_cipher('hello', 3)).to eql('khoor')
  end

  it 'maintains spacing' do
    expect(caesar_cipher('hello hello', 3)).to eql('khoor khoor')
  end

  it 'maintains punctuation' do
    expect(caesar_cipher('hello!', 3)).to eql('khoor!')
  end

  it 'maintains capitalization' do
    expect(caesar_cipher('hElLo', 3)).to eql('kHoOr')
  end
end