require 'rails_helper'
require_relative '../../app/ocr/fileentry'
require_relative '../../app/ocr/digitparser'
require_relative '../../app/ocr/accountbuilder'
require_relative '../../app/ocr/account'
require_relative '../../app/ocr/accountvalidator'


describe AccountValidator do

  let(:account_validator) { AccountValidator.new }
  subject { account_validator }

  describe '#validate' do

    it 'should return true if the account number contains 9 known digits that create a valid checksum' do

      expect(account_validator.validate?('345882865')).to eq(true)

    end

  end

  describe '#get_state' do

    it 'should return a state of illegal if it contains 9 known digits that do not create a valid checksum' do

      expect(account_validator.get_state('333333333')).to eq('ILL')

    end

    it 'should return a state of error if it contains any unknown digits' do

      expect(account_validator.get_state('3458?28?5')).to eq('ERR')

    end

  end

end