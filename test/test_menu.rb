class MenuTest < MiniTest::Unit::TestCase
  include Rlocu

  def test_options
    meta_options_hash = {'name' => "Chicken"}
    assert_equal "Chicken ", Rlocu::Menu::Option.new(meta_options_hash).to_s
  end
end