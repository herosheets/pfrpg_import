module PfrpgImport
  class HeroclassSpells

    attr_reader :spells
    def initialize(csv_rows)
      @spells = pretty_print(parse_spells(csv_rows))
    end

    def parse_spells(rows)
      rows.map { |row| to_spell_row(row[6..15]) }
    end

    def to_spell_row(row)
      spells = []
      for i in 0..9
        f = row[i] || "0"
        f = f.gsub("—","0")
        spells[i] = Integer(f)
      end
      return spells
    end

    def pretty_print(rows)
      str = "[\n"
      rows.each do |row|
        str += "\t\t\t\t#{row},\n"
      end
      str += "\t\t\t]\n"
      str
    end
  end
end