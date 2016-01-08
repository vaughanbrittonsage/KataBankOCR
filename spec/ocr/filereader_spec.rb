require 'rails_helper'
require_relative '../../app/ocr/filereader'
require_relative '../../app/ocr/fileentry'
require 'pry'

describe FileReader do

  let(:filereader) { FileReader.new }

  it 'should split the content into 2 entries made up of 4 lines each' do
    content = '---------------------------\n' +
              '---------------------------\n' +
              '---------------------------\n' +
              '---------------------------\n' +
              '---------------------------\n' +
              '---------------------------\n' +
              '---------------------------\n' +
              '---------------------------\n'

    entries = filereader.get_entries(content)
    expect(entries.length).to eq(2)
  end

  it 'should return a single entry with 9 cells with digit chars for 123456789' do

    content = '    _  _     _  _  _  _  _ \n' +
              '  | _| _||_||_ |_   ||_||_|\n' +
              '  ||_  _|  | _||_|  ||_| _|\n' +
              '                           '

    entries = filereader.get_entries(content)

    expect(entries.length).to eq(1)

    expect(entries[0].cells.length).to eq(9)

    expect(entries[0].cells[0]).to eq('     |  |   ')

  end

end