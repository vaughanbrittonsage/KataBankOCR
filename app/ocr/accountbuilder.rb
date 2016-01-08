require 'pry'

class AccountBuilder

  def build(entry, digit_parser)

    if !entry.valid?
      raise 'InvalidFileEntryException'
    end

    account = Account.new

    entry.cells.each do |cell|
      part = AccountPart.new
      part.characters = cell
      part.value = digit_parser.parse(cell)
      account.parts.push(part)
    end

    account

  end

end