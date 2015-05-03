module PfrpgImport
  class RaceTraits

    attr_reader :traits
    def initialize(csv_rows)
      @traits = parse_traits(csv_rows)
    end

    def parse_traits(rows)
      rows.map { |row| to_trait(row) }
    end

    def to_trait(row)
      params = {
          name: row[0],
          description:   row[1],
          effects: get_effect_strings(row[0],row[2])
      }
      return Trait.new(params)
    end

    def parse_effects(name, effect_string)
      effects = []
      effect_string.split(';').each do |effect|
        tokens = effect.split(':')
        effects << "Effect.new('#{tokens[0]}','Racial Trait: #{name}', '#{tokens[1]}', '#{tokens[2]}')"
      end
      return effects.join(',\n')
    end

  end
end