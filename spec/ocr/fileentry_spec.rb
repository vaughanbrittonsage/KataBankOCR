require 'rails_helper'
require_relative '../../app/ocr/fileentry'
require 'pry'

describe FileEntry do

  it 'should be valid when it contains 9 cells that each contain 9 characters' do
    entry = FileEntry.new
    entry.cells = ['------------',
                   '------------',
                   '------------',
                   '------------',
                   '------------',
                   '------------',
                   '------------',
                   '------------',
                   '------------']
    expect(entry).to be_valid
  end

  it 'should not be valid when it does not contain 9 cells' do
    entry = FileEntry.new
    expect(entry).to_not be_valid
  end

  it 'should not be valid when 1 or more cell does not contain 9 characters' do
    entry = FileEntry.new
    entry.cells = ['---','---','---','---','---','---','---','---','---']
    expect(entry).to_not be_valid
  end

end