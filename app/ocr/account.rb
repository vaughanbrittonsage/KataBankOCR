require 'pry'
class Account

  attr_accessor :parts

  def initialize
    @parts = []
  end

  def get_value

    value = ''

    #iterate threw each part of this account
    @parts.each do |p|
      #append the part digit value to the return value
      value += p.value
    end

    value

  end

  def get_state

    #iterate threw each part of this account
    @parts.each do |part|
      #check if the current part is for an unknown character set
      if part.value == '?'
        #unknown character set so return an error state
        return 'ERR'
      end
    end

    #check if the account is a valid checksum
    if !valid?
      #account is not a valid checksum so return the illegal state
      return 'ILL'
    end

    #the account number is valid so return an empty state indicating it is valid
    return ''

  end

  def valid?

    #check account for valid checksum

    checksumValue = 0

    #iterate 9 times (once for each part of the account number)
    for i in 0...9

      #check if the account part is unknown
      if @parts[i].value == '?'
        #the current account part is unknown so the account is not valid
        return false
      end

      #convert the current account part value into an integer
      digit = @parts[i].value.to_i
      operand = 9 - i
      #add to the checksum value
      checksumValue += digit * operand

    end

    #determine if the accountnumber is a valid checksum
    if checksumValue % 11 == 0
      return true
    else
      return false
    end

  end

end