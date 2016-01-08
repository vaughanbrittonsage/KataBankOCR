require 'pry'

class AccountBuilder

  def build(entry, digit_parser)

    #make sure the file entry is valid before attempting to build an account from it
    if !entry.valid?
      raise 'InvalidFileEntryException'
    end

    account = Account.new

    #iterate threw each cell within this entry
    entry.cells.each do |cell|
      part = AccountPart.new
      #add the cell characters to the account part
      part.characters = cell
      #parse the cell characters into a digit value
      part.value = digit_parser.parse(cell)

      #add this account part to the account
      account.parts.push(part)
    end

    account

  end

end