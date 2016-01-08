require 'rails_helper'
require_relative '../../app/ocr/fileentry'
require_relative '../../app/ocr/digitparser'
require_relative '../../app/ocr/accountbuilder'
require_relative '../../app/ocr/account'
require_relative '../../app/ocr/accountpart'


describe 'account' do

  let(:account) { Account.new }
  subject { account }

  it 'should be valid if it contains 9 known digits that create a valid checksum' do

    part1 = AccountPart.new
    part1.value = '3'
    account.parts.push(part1)

    part2 = AccountPart.new
    part2.value = '4'
    account.parts.push(part2)

    part3 = AccountPart.new
    part3.value = '5'
    account.parts.push(part3)

    part4 = AccountPart.new
    part4.value = '8'
    account.parts.push(part4)

    part5 = AccountPart.new
    part5.value = '8'
    account.parts.push(part5)

    part6 = AccountPart.new
    part6.value = '2'
    account.parts.push(part6)

    part7 = AccountPart.new
    part7.value = '8'
    account.parts.push(part7)

    part8 = AccountPart.new
    part8.value = '6'
    account.parts.push(part8)

    part9 = AccountPart.new
    part9.value = '5'
    account.parts.push(part9)

    expect(account).to be_valid

  end

  it 'should be invalid if it contains 9 known digits that do not create a valid checksum' do

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

    account_state = account.get_state
    expect(account_state).to eq('ILL')

  end

  it 'should be error if it contains any unknown digits' do

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

    account_state = account.get_state
    expect(account_state).to eq('ERR')


  end

end