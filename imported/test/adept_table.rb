class PfrpgTables::Tables::Heroclasses::Adept
  def self.level_bonus(level)
    bonus = nil
    case level
        when 1
    bonus = { :base_attack_bonus => [0,],
              :fort_save         => 0,
              :ref_save          => 0,
              :will_save         => 2,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(1)
            }
  when 2
    bonus = { :base_attack_bonus => [1,],
              :fort_save         => 0,
              :ref_save          => 0,
              :will_save         => 3,
              :granted_features  => ['summon familiar',],
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(2)
            }
  when 3
    bonus = { :base_attack_bonus => [1,],
              :fort_save         => 1,
              :ref_save          => 1,
              :will_save         => 3,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(3)
            }
  when 4
    bonus = { :base_attack_bonus => [2,],
              :fort_save         => 1,
              :ref_save          => 1,
              :will_save         => 4,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(4)
            }
  when 5
    bonus = { :base_attack_bonus => [2,],
              :fort_save         => 1,
              :ref_save          => 1,
              :will_save         => 4,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(5)
            }
  when 6
    bonus = { :base_attack_bonus => [3,],
              :fort_save         => 2,
              :ref_save          => 2,
              :will_save         => 5,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(6)
            }
  when 7
    bonus = { :base_attack_bonus => [3,],
              :fort_save         => 2,
              :ref_save          => 2,
              :will_save         => 5,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(7)
            }
  when 8
    bonus = { :base_attack_bonus => [4,],
              :fort_save         => 2,
              :ref_save          => 2,
              :will_save         => 6,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(8)
            }
  when 9
    bonus = { :base_attack_bonus => [4,],
              :fort_save         => 3,
              :ref_save          => 3,
              :will_save         => 6,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(9)
            }
  when 10
    bonus = { :base_attack_bonus => [5,],
              :fort_save         => 3,
              :ref_save          => 3,
              :will_save         => 7,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(10)
            }
  when 11
    bonus = { :base_attack_bonus => [5,],
              :fort_save         => 3,
              :ref_save          => 3,
              :will_save         => 7,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(11)
            }
  when 12
    bonus = { :base_attack_bonus => [6,1,],
              :fort_save         => 4,
              :ref_save          => 4,
              :will_save         => 8,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(12)
            }
  when 13
    bonus = { :base_attack_bonus => [6,1,],
              :fort_save         => 4,
              :ref_save          => 4,
              :will_save         => 8,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(13)
            }
  when 14
    bonus = { :base_attack_bonus => [7,2,],
              :fort_save         => 4,
              :ref_save          => 4,
              :will_save         => 9,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(14)
            }
  when 15
    bonus = { :base_attack_bonus => [7,2,],
              :fort_save         => 5,
              :ref_save          => 5,
              :will_save         => 9,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(15)
            }
  when 16
    bonus = { :base_attack_bonus => [8,3,],
              :fort_save         => 5,
              :ref_save          => 5,
              :will_save         => 10,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(16)
            }
  when 17
    bonus = { :base_attack_bonus => [8,3,],
              :fort_save         => 5,
              :ref_save          => 5,
              :will_save         => 10,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(17)
            }
  when 18
    bonus = { :base_attack_bonus => [9,4,],
              :fort_save         => 6,
              :ref_save          => 6,
              :will_save         => 11,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(18)
            }
  when 19
    bonus = { :base_attack_bonus => [9,4,],
              :fort_save         => 6,
              :ref_save          => 6,
              :will_save         => 11,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(19)
            }
  when 20
    bonus = { :base_attack_bonus => [10,5,],
              :fort_save         => 6,
              :ref_save          => 6,
              :will_save         => 12,
              :granted_features  => nil,
              :choices           => nil,
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.Adept(20)
            }

    end
    return bonus
  end
end
