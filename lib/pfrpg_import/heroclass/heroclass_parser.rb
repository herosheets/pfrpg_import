module PfrpgImport
  class HeroclassParser
    include CaseHelpers
    attr_reader :facts, :levels, :spells, :filename_prefix
    def initialize(csv)
      factbundle = {
          heroclass_name: csv[0][1],
          description:    csv[1][1],
          class_skills:   csv[2][1],
          alignment:      csv[3][1],
          starting_wealth:csv[4][1],
          hit_die:        csv[5][1],
          skills_per:     csv[6][1],
          spell_mod:      csv[7][1],
          starting_feats: csv[8][1]
      }

      @facts = HeroclassFacts.new(factbundle)
      @levels = HeroclassLevels.new(csv[11..30]).levels
      @spells = HeroclassSpells.new(csv[11..30]).spells
      @filename_prefix = parse_filename
    end

    def parse_filename
      underscored_title(@facts.friendly_name)
    end
  end
end