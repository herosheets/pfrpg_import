require 'active_support/inflector'

module PfrpgImport::CaseHelpers

  class String
    def underscore
      self.gsub(/::/, '/').
          gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          tr("-", "_").
          tr(" ", "_").
          downcase
    end
  end

  def camelized_title(title)
    title.camelize.gsub(' ','')
  end

  def underscored_title(title)
    title.underscore
  end

  def arrayify(string_list)
    str = "["
    string_list.each do |b|
      str = str + "#{b},"
    end
    return str + ']'
  end
end