
class FileEntry
  attr_accessor :cells

  def initialize
    @cells = []
  end

  def valid?

    if @cells.length != 9
      return false
    end

    @cells.each do |cell|
      if cell.length != 12
        return false
      end
    end

    return true

  end



end