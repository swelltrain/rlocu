include Rlocu

RSpec.describe Menu::Option, '#new' do
  it 'should set the name and price' do
    option = Menu::Option.new(menu_option)
    expect(option.name).to eq(menu_option['name'])
    expect(option.price).to eq(menu_option['price'])
  end
end
