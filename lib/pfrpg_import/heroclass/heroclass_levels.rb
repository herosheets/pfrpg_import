module PfrpgImport
  class HeroclassLevels

    attr_reader :levels
    def initialize(csv_rows)
      @levels = parse_levels(csv_rows)
    end

    def parse_levels(rows)
      rows.map { |row| to_level(row) }
    end

    def to_level(row)
      params = {
          level: row[0],
          bab:   row[1],
          fort_save: row[2],
          ref_save: row[3],
          will_save: row[4],
          granted_features: row[5],
          choices: nil
      }
      return Level.new(params)
    end
  end
end