require 'pry'
class Account

  attr_accessor :parts

  def initialize
    @parts = []
  end

  def get_value

    value = ''

    @parts.each do |p|
      value += p.value
    end

    value

  end

  def get_state

    @parts.each do |part|
      if part.value == '?'
        return 'ERR'
      end
    end

    if !valid?
      return 'ILL'
    end

    return ''

  end

  def valid?

    #check account for valid checksum

    checksumValue = 0

    for i in 0...9

      if @parts[i].value == '?'
        return false
      end

      digit = @parts[i].value.to_i
      operand = 9 - i
      checksumValue += digit * operand

    end

    if checksumValue % 11 == 0
      return true
    else
      return false
    end

  end

end