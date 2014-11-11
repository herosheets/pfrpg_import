module PfrpgImport
  class HeroclassWriter
    include CaseHelpers

    def initialize(facts, filename, path='./imported/')
      @facts = facts
      @filename = filename
      @path = path
    end

    def print_class
      filename = "#{@path}#{underscored_title(@filename)}.rb"
      table = File.new(filename, "w")
      str = "class PfrpgClasses::#{camelized_title(@filename)} < PfrpgClasses::Heroclass\n"
      str += @facts.print_name
      str += @facts.print_hit_die
      str += @facts.print_starting_wealth
      str += @facts.print_bonuses_for_level
      str += @facts.print_create_feature
      str += @facts.print_alignment
      str += @facts.print_skills_per_level
      str += @facts.print_spells_bonus_attr
      str += @facts.print_spells_per_day
      str += @facts.print_description
      str += @facts.print_skills
      str += @facts.print_feature_type
      str += @facts.print_starting_feats
      str += "end"
      table.puts str
      table.close
      puts "Wrote #{filename}"
    end

  end
end