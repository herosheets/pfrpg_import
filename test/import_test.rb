require 'minitest/autorun'
require 'pfrpg_import'
require 'pfrpg_classes'
require 'pfrpg_tables'

class ImportTest < Minitest::Test

  def setup
    @path = './imported/test/'
    if Dir.exists?("#{@path}")
      FileUtils.rm_rf("#{@path}")
    end
    # Dir.mkdir("#{@path}") unless Dir.exists?("#{@path}")
    Dir.mkdir("#{@path}")
  end

  def teardown

  end

  def test_import_adept_ruby
    f = PfrpgImport::HeroclassImporter.new('adept.csv', @path)
    f.import_heroclass
    puts "Files present: #{Dir.glob(@path + "/*")}"
    # ensure the files are valid ruby
    assert load './imported/test/adept_table.rb'
    assert load './imported/test/adept_spells.rb'
    assert load './imported/test/adept_feature_info.rb'
    assert load './imported/test/adept.rb'
  end

  def test_import_aasimar_ruby
    f = PfrpgImport::HeroclassImporter.new('adept.csv', @path)
    f.import_heroclass
    puts "Files present: #{Dir.glob(@path + "/*")}"
    # ensure the files are valid ruby
    assert load './imported/test/adept_table.rb'
    assert load './imported/test/adept_spells.rb'
    assert load './imported/test/adept_feature_info.rb'
    assert load './imported/test/adept.rb'
  end

end