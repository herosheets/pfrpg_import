class AdeptFeatureInfoInfo

  def self.by_name(name)
    self.all.find { |x| x.name == name }
  end

  def self.all
    [     ]
  end

  def feature_type
    "AdeptFeature"
  end
end
