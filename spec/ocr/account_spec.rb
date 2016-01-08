require 'rails_helper'
require_relative '../../app/ocr/fileentry'
require_relative '../../app/ocr/digitparser'
require_relative '../../app/ocr/accountbuilder'
require_relative '../../app/ocr/account'
require_relative '../../app/ocr/accountpart'


describe Account do

  let(:account) { Account.new }
  subject { account }

  it 'should return the correct number of unknown parts' do

    part1 = AccountPart.new
    part1.value = '3'
    account.parts.push(part1)

    part2 = AccountPart.new
    part2.value = '3'
    account.parts.push(part2)

    part3 = AccountPart.new
    part3.value = '?'
    account.parts.push(part3)

    part4 = AccountPart.new
    part4.value = '3'
    account.parts.push(part4)

    part5 = AccountPart.new
    part5.value = '3'
    account.parts.push(part5)

    part6 = AccountPart.new
    part6.value = '?'
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

    unknown_parts = account.get_unknown_parts.length

    expect(unknown_parts).to eq(2)


  end

end