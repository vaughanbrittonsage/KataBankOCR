require 'pry'

class FileReader

  def get_entries(content)

    entries = []

    lines = content.split('\n')

    line_index = 0.0

    #loop through each line in the file contents
    lines.each do |line|

      line_number = line_index + 1

      #calculate the index of the current entry (entries are made up of 4 lines)
      entry_index = (line_number / 4).ceil - 1

      #check if an entry has already been created for the current line position
      if entries.length < entry_index + 1
        entries.push(FileEntry.new)
      end

      char_index = 0.0
      #restrict the line to max 27 chars in length and loop through each of the chars
      line[0...27].split("").each do |char|

        char_number = char_index + 1

        #calculate the index of the cell the current char belongs to within the current entry (cells are 3 chars in length)
        cell_index = (char_number / 3.0).ceil - 1

        #check if an entry has already been created for the current cell position
        if entries[entry_index].cells.length < cell_index + 1
          entries[entry_index].cells.push('')
        end

        #add the current char to the cell string
        entries[entry_index].cells[cell_index] += char

        char_index += 1

      end

      line_index += 1

    end

    entries

  end
end