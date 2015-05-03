module PfrpgImport
  class Trait
    include CaseHelpers
    attr_reader :name, :description, :effects
    
    def initialize(params)
      @name = parse_name(params[:name])
      @description = parse_description(params[:description])
      @has_effects = false
      @effects = parse_effects(params[:effects])
    end

    def parse_name(name)
      return name
    end

    def parse_description(description_string)
      return description_string
    end

    def parse_effect(effects_string)
      @has_effects = !(effects_string.blank?)
      return effects_string
    end

    def to_s(title)
      if @has_effects
      <<-eos
        PfrpgRaces::RacialTrait.new( :name => "#{@name}",
                       :description => "#{description}"
                       :effects =>
                        [
                          #{@effects}
                        ]
                      ),
      eos
      else
        <<-eos
        PfrpgRaces::RacialTrait.new( :name => "#{@name}",
                       :description => "#{description}"),
        eos
      end
    end
  end
end