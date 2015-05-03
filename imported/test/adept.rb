class PfrpgClasses::Adept < PfrpgClasses::Heroclass
  def name
    "Adept"
  end

  def hit_die
    Dice.new(1,6)
  end

  def starting_wealth
    Dice.new(5,6, multiplier = 10)
  end

  def bonuses_for_level(level)
    PfrpgTables::Heroclasses::Adept.level_bonus(level)
  end

  def create_feature(f)
    AdeptFeature.new(:ability_name => f)
  end

  def alignment
    PfrpgCore::Alignment.any
  end

  def skills_per_level
    2
  end

  def spells_bonus_attr
    "wis"
  end

  def get_spells_table(level)
    PfrpgTables::Spells::SpellsPerDay.Adept(level)
  end

  def description
    "None"
  end

  def skills
    [ Skill::Craft.new, Skill::HandleAnimal.new, Skill::Heal.new, Skill::Knowledge.new, Skill::Profession.new, Skill::Spellcraft.new, Skill::Survival.new,  ]
  end

  def feature_type
    "AdeptFeature"
  end

  def starting_feats
    [ 'Simple Weapon Proficiency', ]
  end

end
