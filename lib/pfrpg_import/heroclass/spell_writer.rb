module PfrpgImport
  class SpellWriter
    include CaseHelpers
    def initialize(spells, filename, path='./imported/')
      @spells = spells
      @filename = filename
      @path = path
    end

    def print_spells
      filename = "#{@path}#{underscored_title(@filename)}_spells.rb"
      table = File.new(filename, "w")
      str = "class PfrpgTables::Tables::Spells::SpellsPerDay\n"
      str += "  def self.#{camelized_title(@filename)}(level)\n"
      str += print_level_bonus
      str += "  end\n"
      str += "end\n"
      table.puts str
      table.close
      puts "Wrote #{filename}"
    end

    def print_level_bonus
      <<-eos
    spells =
      #{@spells}
    spells[level-1]
      eos
    end

  end
end