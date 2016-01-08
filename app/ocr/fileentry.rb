
class FileEntry
  attr_accessor :cells

  def initialize
    @cells = []
  end

  def valid?

    #check if this entry contains the correct amount of cells
    if @cells.length != 9
      return false
    end

    #check if any of the cells don't contain 12 characters to make up a digit
    @cells.each do |cell|
      if cell.length != 12
        return false
      end
    end

    return true

  end



end