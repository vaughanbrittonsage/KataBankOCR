require 'rails_helper'
require_relative '../../app/ocr/digitparser'

describe DigitParser do

  let(:parser) { DigitParser.new }

  it 'should identify a numeric 1 digit from its 3x4 cell of characters' do
    chars = '   ' +
            '  |' +
            '  |' +
            '   ' #char set for numeric 1 digit
    value = parser.parse(chars)

    expect(value).to eq('1')
  end

  it 'should identify a numeric 2 digit from its 3x4 cell of characters' do
    chars = ' _ ' +
            ' _|' +
            '|_ ' +
            '   ' #char set for numeric 2 digit
    value = parser.parse(chars)

    expect(value).to eq('2')
  end

  it 'should identify a numeric 3 digit from its 3x4 cell of characters' do
    chars = ' _ ' +
            ' _|' +
            ' _|' +
            '   ' #char set for numeric 3 digit
    value = parser.parse(chars)

    expect(value).to eq('3')
  end

  it 'should identify a numeric 4 digit from its 3x4 cell of characters' do
    chars = '   ' +
            '|_|' +
            '  |' +
            '   ' #char set for numeric 4 digit
    value = parser.parse(chars)

    expect(value).to eq('4')
  end

  it 'should identify a numeric 5 digit from its 3x4 cell of characters' do
    chars = ' _ ' +
            '|_ ' +
            ' _|' +
            '   ' #char set for numeric 5 digit
    value = parser.parse(chars)

    expect(value).to eq('5')
  end

  it 'should identify a numeric 6 digit from its 3x4 cell of characters' do
    chars = ' _ ' +
            '|_ ' +
            '|_|' +
            '   ' #char set for numeric 6 digit
    value = parser.parse(chars)

    expect(value).to eq('6')
  end

  it 'should identify a numeric 7 digit from its 3x4 cell of characters' do
    chars = ' _ ' +
            '  |' +
            '  |' +
            '   ' #char set for numeric 7 digit
    value = parser.parse(chars)

    expect(value).to eq('7')
  end

  it 'should identify a numeric 8 digit from its 3x4 cell of characters' do
    chars = ' _ ' +
            '|_|' +
            '|_|' +
            '   ' #char set for numeric 8 digit
    value = parser.parse(chars)

    expect(value).to eq('8')
  end

  it 'should identify a numeric 9 digit from its 3x4 cell of characters' do
    chars = ' _ ' +
            '|_|' +
            ' _|' +
            '   ' #char set for numeric 9 digit
    value = parser.parse(chars)

    expect(value).to eq('9')
  end

  it 'should identify a numeric 0 digit from its 3x4 cell of characters' do
    chars = ' _ ' +
            '| |' +
            '|_|' +
            '   ' #char set for numeric 0 digit
    value = parser.parse(chars)

    expect(value).to eq('0')
  end


  it 'should not identify a digit from a 3x4 cell of unrecognised characters' do
    chars = '--||--||-' #random unknown char set
    value = parser.parse(chars)

    expect(value).to eq('?')
  end

end