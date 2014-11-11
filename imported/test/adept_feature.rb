class AdeptFeature < ClassFeature
  def feature
    AdeptFeatureInfo.by_name(self.ability_name)
  end

  def self.from_feature_info(feature_info)
    c = AdeptFeature.new
    c.ability_name = feature_info.name
    c
  end
end
