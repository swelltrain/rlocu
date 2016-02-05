include Rlocu

RSpec.describe Menu, '#new' do
  it 'should set menu name and sections' do
    menu = Menu.new(menu_hash)
    expect(menu.menu_name).to eq(menu_hash['menu_name'])
    expect(menu.sections).not_to be_empty
  end
end
