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

  def repair(account, digit_parser)

    alternate_account_numbers = []

    #iterate over each part to this account
    account.parts.each do |part|

      #look for any available variants of this part of the account number
      variants = get_account_variants(account, part, digit_parser)
      #if any variants are found add them to the output array
      variants.each do |variant|
        alternate_account_numbers.push(variant)
      end

    end

    alternate_account_numbers

  end

  def get_account_variants(account, part, digit_parser)

    variants = []

    char_index = 0

    #iterate over each character within this part of the account number
    part.characters.split('').each do |char|
      #if the current character is empty then attempt to replace it
      if char == ' '

          #try replacing the current character with an underscore
          new_characters = replace_character_part(part.characters, char_index, '_')
          #check if the new character set produces a known digit
          new_digit = digit_parser.parse(new_characters)
          if new_digit != '?'
            #a known digit was parsed so replace the current part in the account number with the new digit and add to the variant array
            variants.push(replace_account_part(account, account.parts.index(part), new_digit))
          end

          #try replacing the current character with a pipe
          new_characters = replace_character_part(part.characters, char_index, '|')
          #check if the new character set produces a known digit
          new_digit = digit_parser.parse(new_characters)
          if new_digit != '?'
            #a known digit was parsed so replace the current part in the account number with the new digit and add to the variant array
            variants.push(replace_account_part(account, account.parts.index(part), new_digit))
          end
      else
        #the current character is not empty so try replacing it with a space
        new_characters = replace_character_part(part.characters, char_index, ' ')
        #check if the new character set produces a known digit
        new_digit = digit_parser.parse(new_characters)
        if new_digit != '?'
          #a known digit was parsed so replace the current part in the account number with the new digit and add to the variant array
          variants.push(replace_account_part(account, account.parts.index(part), new_digit))
        end
      end

      char_index += 1
    end

    variants
  end

  def replace_character_part(characters, char_index, char)
    #create an array of the string characters
    char_array = characters.split('')
    #replace the char within the array
    char_array[char_index] = char
    #join the array characters back into a string
    char_array.join('')
  end

  def replace_account_part(account, part_index, new_digit)

    account_number = ''

    #iterate over each part of the account
    account.parts.each do |part|

      #if the current account part is at the specified index point then append the new digit
      if account.parts.index(part) == part_index
        account_number += new_digit
      else
        #otherwise use the existing digit value
        account_number += part.value
      end

    end

    account_number

  end

end