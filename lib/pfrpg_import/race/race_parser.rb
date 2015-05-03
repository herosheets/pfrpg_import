module PfrpgImport
  class RaceParser
    include CaseHelpers
    attr_reader :facts, :levels, :spells, :filename_prefix
    def initialize(csv)
      factbundle = {
          race_name:         csv[0][1],
          description:       csv[1][1],
          source:            csv[2][1],
          attribute_bonuses: csv[3][1],
          languages:         csv[4][1],
          int_languages:     csv[6][1],
          speed:             csv[5][1],
          size:              csv[7][1],
          type:              csv[8][1]
      }

      @traits = RaceTraits.new(csv[9..20]).traits
      @facts = RaceFacts.new(factbundle)
      @filename_prefix = parse_filename
    end

    def parse_filename
      underscored_title(@facts.friendly_name)
    end
  end
end