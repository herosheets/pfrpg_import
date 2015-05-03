module PfrpgImport
  class Level
    include CaseHelpers
    attr_reader :level, :bab, :fort_save, :ref_save, :will_save,
                :granted_features, :choices
    def initialize(params)
      @level = parse_level(params[:level])
      @bab = parse_bab(params[:bab])
      @fort_save = parse_save(params[:fort_save])
      @ref_save = parse_save(params[:ref_save])
      @will_save = parse_save(params[:will_save])
      @granted_features = parse_features(params[:granted_features])
      @choices = parse_choices(params[:choices])
    end

    def parse_level(level)
      return Integer(level.gsub("nd","").gsub("th","").gsub("st","").gsub("rd",""))
    end

    def parse_bab(bab_string)
      return arrayify(bab_string.gsub("+", "").split('/'))
    end

    def parse_save(save)
      return save.gsub("+", "")
    end

    def parse_features(features)
      return 'nil' if (!features || features.empty?)
      return arrayify(features.split(',').map { |x| "\'#{x.underscore.downcase}\'" })
    end

    def parse_choices(choices)
      return 'nil' if (!choices || choices.empty?)
      return arrayify(choices)
    end

    def to_s(title)
      <<-eos
  when #{level}
    bonus = { :base_attack_bonus => #{bab},
              :fort_save         => #{fort_save},
              :ref_save          => #{ref_save},
              :will_save         => #{will_save},
              :granted_features  => #{granted_features},
              :choices           => #{choices},
              :spells_per_day => PfrpgTables::Tables::Spells::SpellsPerDay.#{title}(#{level})
            }
      eos
    end
  end
end