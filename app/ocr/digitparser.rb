
class DigitParser

  def initialize
    @digit_library = [
        { :chars => '   ' +
                    '  |' +
                    '  |' +
                    '   ', :value => '1' },
        { :chars => ' _ ' +
                    ' _|' +
                    '|_ ' +
                    '   ', :value => '2' },
        { :chars => ' _ ' +
                    ' _|' +
                    ' _|' +
                    '   ', :value => '3' },
        { :chars => '   ' +
                    '|_|' +
                    '  |' +
                    '   ', :value => '4' },
        { :chars => ' _ ' +
                    '|_ ' +
                    ' _|' +
                    '   ', :value => '5' },
        { :chars => ' _ ' +
                    '|_ ' +
                    '|_|' +
                    '   ', :value => '6' },
        { :chars => ' _ ' +
                    '  |' +
                    '  |' +
                    '   ', :value => '7' },
        { :chars => ' _ ' +
                    '|_|' +
                    '|_|' +
                    '   ', :value => '8' },
        { :chars => ' _ ' +
                    '|_|' +
                    ' _|' +
                    '   ', :value => '9' },
        { :chars => ' _ ' +
                    '| |' +
                    '|_|' +
                    '   ', :value => '0' }
    ]
  end

  def parse(digit)

    #look for a digit in the ref library that matches the 3x3 cell char set
    dl = @digit_library.find { |x| x[:chars] == digit }

    #check if a match was found in the ref library and if so return the value
    if dl
      dl[:value]
    else
      #no match could be found so return a question mark
      '?'
    end

  end

end