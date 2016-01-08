require 'rails_helper'
require 'pry'
require_relative '../../app/ocr/fileentry'
require_relative '../../app/ocr/filereader'
require_relative '../../app/ocr/digitparser'
require_relative '../../app/ocr/accountbuilder'
require_relative '../../app/ocr/account'
require_relative '../../app/ocr/accountpart'

describe AccountBuilder do

  let(:account_builder) { AccountBuilder.new }
  let(:digit_parser) { DigitParser.new }
  let(:file_reader) { FileReader.new }

  it 'should build an Account object from a valid FileEntry object' do
    file_entry = FileEntry.new
    file_entry.cells.push('------------')
    file_entry.cells.push('------------')
    file_entry.cells.push('------------')
    file_entry.cells.push('------------')
    file_entry.cells.push('------------')
    file_entry.cells.push('------------')
    file_entry.cells.push('------------')
    file_entry.cells.push('------------')
    file_entry.cells.push('------------')
    account_builder.build(file_entry, digit_parser)
  end

  it 'should throw an exception when trying to build an invalid FileEntry object' do
    file_entry = FileEntry.new
    expect { account_builder.build(file_entry, digit_parser) }.to raise_error 'InvalidFileEntryException'
  end

  it 'should build an account with the parts 123456789' do

    content = '    _  _     _  _  _  _  _ \n' +
              '  | _| _||_||_ |_   ||_||_|\n' +
              '  ||_  _|  | _||_|  ||_| _|\n' +
              '                           '

    entries = file_reader.get_entries(content)

    expect(entries.length).to eq(1)

    account = account_builder.build(entries[0], digit_parser)
    account_value = account.get_value

    expect(account_value).to eq('123456789')

  end

end