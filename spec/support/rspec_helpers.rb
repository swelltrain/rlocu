module RspecHelpers
  def menu_option
    {'name' => 'spec', 'price' => '1'}
  end

  def menu_options
    [menu_option]
  end

  def menu_option_group
    {'type' => 'spec', 'text' => 'foo', 'options' => menu_options}
  end
end

RSpec.configure do |config|
  config.include RspecHelpers
end
