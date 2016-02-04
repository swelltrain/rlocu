include Rlocu

RSpec.describe Menu::MenuItem, '#new' do
  it 'should set menu_name, section_name, subsection_name, section_text, type and currency_symbol' do
    menu_item = Menu::MenuItem.new(menu_menu_item_hash)
    expect(menu_item.menu_name).to eq(menu_menu_item_hash['menu_name'])
    expect(menu_item.section_name).to eq(menu_menu_item_hash['section_name'])
    expect(menu_item.subsection_name).to eq(menu_menu_item_hash['subsection_name'])
    expect(menu_item.section_text).to eq(menu_menu_item_hash['section_text'])
    expect(menu_item.type).to eq(menu_menu_item_hash['type'])
    expect(menu_item.currency_symbol).to eq(menu_menu_item_hash['currency_symbol'])
  end
end
