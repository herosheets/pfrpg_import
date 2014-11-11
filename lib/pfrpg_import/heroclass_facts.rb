module PfrpgImport
  class HeroclassFacts
    include CaseHelpers
    attr_reader :friendly_name, :hit_die, :start_wealth, :starting_wealth_avg,
                :alignment, :skills_per_level, :spells_bonus_attr, :description,
                :class_skills, :starting_feats, :feature_type

    def initialize(bundle)
      @friendly_name = bundle[:heroclass_name]
      @hit_die       = bundle[:hit_die].gsub("d","")
      @start_wealth  = bundle[:starting_wealth]
      @starting_wealth_average = bundle[:starting_wealth_avg]
      @alignment     = bundle[:alignment]
      @skills_per_level = bundle[:skills_per]
      @spells_bonus_attr = bundle[:spell_mod]
      @description   = bundle[:description]
      @class_skills  = bundle[:class_skills]
      @starting_feats= bundle[:starting_feats]
      @feature_type  = get_feature_type(@friendly_name)
    end

    def title
      @friendly_name.underscore
    end

    def get_feature_type(friendly_name)
      "#{camelized_title(friendly_name)}Feature"
    end

    def print_name
      <<-eos
  def name
    "#{@friendly_name}"
  end

      eos
    end

    def print_hit_die
      <<-eos
  def hit_die
    Dice.new(1,#{@hit_die})
  end

      eos
    end

    def print_starting_wealth
      <<-eos
  def starting_wealth
    Dice.new(5,6, multiplier = 10)
  end

      eos
    end

    def print_bonuses_for_level
      <<-eos
  def bonuses_for_level(level)
    PfrpgTables::Heroclasses::#{@friendly_name}.level_bonus(level)
  end

      eos
    end

    def print_spells_per_day
      <<-eos
  def get_spells_table(level)
    PfrpgTables::Spells::SpellsPerDay.#{@friendly_name}(level)
  end

      eos
    end

    def print_create_feature
      <<-eos
  def create_feature(f)
    #{@feature_type}.new(:ability_name => f)
  end

      eos
    end

    def print_alignment
      <<-eos
  def alignment
    #{alignment_string}
  end

      eos
    end

    def alignment_string
      case @alignment
      when 'any'
        return 'Alignment.any'
      else
        return 'Alignment.any'
      end
    end

    def print_skills_per_level
      <<-eos
  def skills_per_level
    #{@skills_per_level}
  end

      eos
    end

    def print_spells_bonus_attr
      <<-eos
  def spells_bonus_attr
    "#{@spells_bonus_attr}"
  end

      eos
    end

    def print_description
      <<-eos
  def description
    "#{@description}"
  end

      eos
    end

    def print_skills
      <<-eos
  def skills
    [ #{skills_string} ]
  end

      eos
    end

    def skills_string
      str = ""
      @class_skills.split(',').each do |s|
        str = str + "Skill::#{get_skill_class(s)}.new, "
      end
      str
    end

    def get_skill_class(skill)
      camelized_title(skill)
    end

    def print_feature_type
      <<-eos
  def feature_type
    "#{feature_type}"
  end

      eos
    end

    def print_starting_feats
      <<-eos
  def starting_feats
    [ #{feats_string} ]
  end

      eos
    end

    def feats_string
      str = ""
      @starting_feats.split(",").each do |feat|
        str += "\'#{feat}',"
      end
      return str
    end
  end
end