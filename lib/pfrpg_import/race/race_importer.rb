require 'csv'

module PfrpgImport
  class HeroclassImporter

    attr_reader :levels, :facts, :spells
    def initialize(filename, path=nil)
      @csv = CSV.read(filename)
      @path = path
      parser = RaceParser.new(@csv)
      @levels = parser.levels
      @facts = parser.facts
      @spells = parser.spells
    end

    def import_heroclass
      write_level_table
      write_heroclass_file
      write_feature_file
      write_spell_file
    end

    def write_level_table
      table = LevelWriter.new(@levels, @facts.title, @path)
      table.print_class
    end

    def write_heroclass_file
      heroclass = HeroclassWriter.new(@facts, @facts.title, @path)
      heroclass.print_class
    end

    def write_feature_file
      feature = FeatureWriter.new(@facts, @facts.title, @path)
      feature.print_features
    end

    def write_spell_file
      spell = SpellWriter.new(@spells, @facts.title, @path)
      spell.print_spells
    end
  end
end