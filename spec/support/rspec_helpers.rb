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

  def menu_option_groups
    [menu_option_group]
  end

  def menu_menu_item_hash
    {'menu_name' => 'spec_menu_name', 'section_name' => 'spec_section_name', 'subsection_name' => 'spec_subsection_name', 'section_text' => 'spec_section_text', 'type' => 'type_spec', 'currency_symbol' => 'currency_spec', 'photos' => 'string, of, urls'}
  end
end

RSpec.configure do |config|
  config.include RspecHelpers
end
