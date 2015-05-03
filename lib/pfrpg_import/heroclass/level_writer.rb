module PfrpgImport
  class LevelWriter
    include PfrpgImport::CaseHelpers

    def initialize(levels, filename, path='./imported/')
      @levels = levels
      @filename = filename
      @path = path
    end

    def print_class
      filename = "#{@path}#{underscored_title(@filename)}_table.rb"
      table = File.new(filename, "w")
      str = "class PfrpgTables::Tables::Heroclasses::#{camelized_title(@filename)}\n"
      str += print_level_bonus
      str += "end"
      table.puts str
      table.close
      puts "Wrote #{filename}"
    end

    def print_level_bonus
      level_string = ""
      @levels.each do |level|
        level_string += level.to_s(camelized_title(@filename))
      end
      return <<-eos
  def self.level_bonus(level)
    bonus = nil
    case level
      #{level_string}
    end
    return bonus
  end
      eos
    end

  end
end