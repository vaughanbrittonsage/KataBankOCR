require 'rails_helper'
require 'pry'
require_relative '../../app/ocr/fileentry'
require_relative '../../app/ocr/filereader'
require_relative '../../app/ocr/digitparser'
require_relative '../../app/ocr/accountbuilder'
require_relative '../../app/ocr/account'
require_relative '../../app/ocr/accountpart'
require_relative '../../app/ocr/accountvalidator'

describe AccountBuilder do

  let(:account_builder) { AccountBuilder.new }
  let(:digit_parser) { DigitParser.new }
  let(:file_reader) { FileReader.new }
  let(:account_validator) { AccountValidator.new }

  describe '#build' do

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

  describe '#replace_character_part' do

    it 'should replace the correct character within a string' do
      characters = '123456789'
      new_characters = account_builder.replace_character_part(characters, 1, 3)

      expect(new_characters).to eq('133456789')
    end

  end

  describe '#replace_account_part' do

    it 'should replace the correct part of the account and return the new account number value' do

      account = Account.new

      part1 = AccountPart.new
      part1.value = '3'
      account.parts.push(part1)

      part2 = AccountPart.new
      part2.value = '3'
      account.parts.push(part2)

      part3 = AccountPart.new
      part3.value = '3'
      account.parts.push(part3)

      part4 = AccountPart.new
      part4.value = '3'
      account.parts.push(part4)

      part5 = AccountPart.new
      part5.value = '3'
      account.parts.push(part5)

      part6 = AccountPart.new
      part6.value = '3'
      account.parts.push(part6)

      part7 = AccountPart.new
      part7.value = '3'
      account.parts.push(part7)

      part8 = AccountPart.new
      part8.value = '3'
      account.parts.push(part8)

      part9 = AccountPart.new
      part9.value = '3'
      account.parts.push(part9)

      new_account_value = account_builder.replace_account_part(account, 2, '5')

      expect(new_account_value).to eq('335333333')
      end

  end

  describe '#repair' do

    it 'should repair account 888888888 and return 27 variants of which 3 should be valid variants' do

      account = Account.new

      part1 = AccountPart.new
      part1.characters =  ' _ ' +
                          '|_|' +
                          '|_|' +
                          '   '
      part1.value = '8'
      account.parts.push(part1)

      part2 = AccountPart.new
      part2.characters =  ' _ ' +
                          '|_|' +
                          '|_|' +
                          '   '
      part2.value = '8'
      account.parts.push(part2)

      part3 = AccountPart.new
      part3.characters =  ' _ ' +
                          '|_|' +
                          '|_|' +
                          '   '
      part3.value = '8'
      account.parts.push(part3)

      part4 = AccountPart.new
      part4.characters =  ' _ ' +
                          '|_|' +
                          '|_|' +
                          '   '
      part4.value = '8'
      account.parts.push(part4)

      part5 = AccountPart.new
      part5.characters =  ' _ ' +
                          '|_|' +
                          '|_|' +
                          '   '
      part5.value = '8'
      account.parts.push(part5)

      part6 = AccountPart.new
      part6.characters =  ' _ ' +
                          '|_|' +
                          '|_|' +
                          '   '
      part6.value = '8'
      account.parts.push(part6)

      part7 = AccountPart.new
      part7.characters =  ' _ ' +
                          '|_|' +
                          '|_|' +
                          '   '
      part7.value = '8'
      account.parts.push(part7)

      part8 = AccountPart.new
      part8.characters =  ' _ ' +
                          '|_|' +
                          '|_|' +
                          '   '
      part8.value = '8'
      account.parts.push(part8)

      part9 = AccountPart.new
      part9.characters =  ' _ ' +
                          '|_|' +
                          '|_|' +
                          '   '
      part9.value = '8'
      account.parts.push(part9)

      variants = account_builder.repair(account, digit_parser)

      expect(variants.length).to eq(27)

      valid_variants = variants.select { |v|  account_validator.get_state(v) == '' }

      expect(valid_variants.length).to eq(3)

    end

  end

end