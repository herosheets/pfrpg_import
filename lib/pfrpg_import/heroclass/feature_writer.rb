module PfrpgImport
  class FeatureWriter
    include CaseHelpers
    def initialize(features, filename, path='./imported/')
      @features = features
      @filename = filename
      @path = path
    end

    def print_features
      filename = "#{@path}#{underscored_title(@filename)}_feature.rb"
      feature_name = "#{camelized_title(@filename)}Feature"
      table = File.new(filename, "w")
      str = <<-eos
class #{feature_name} < ClassFeature
  def feature
    #{feature_name}Info.by_name(self.ability_name)
  end

  def self.from_feature_info(feature_info)
    c = #{feature_name}.new
    c.ability_name = feature_info.name
    c
  end
end
      eos
      table.puts str
      table.close
      puts "Wrote #{filename}"

      filename = "#{@path}#{underscored_title(@filename)}_feature_info.rb"
      table = File.new(filename, "w")
      str = <<-eos
class #{feature_name}InfoInfo

  def self.by_name(name)
    self.all.find { |x| x.name == name }
  end

  def self.all
    [     ]
  end

  def feature_type
    "#{feature_name}"
  end
end
      eos
      table.puts str
      table.close
      puts "Wrote #{filename}"
    end

    def print_level_bonus
      <<-eos
    spells =
      #{@spells}
    spells[level-1]
      eos
    end
  end
end