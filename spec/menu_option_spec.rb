include Rlocu

RSpec.describe Menu::Option, '#new' do
  it 'should set the name and price' do
    option_hash = {'name' => 'spec', 'price' => '1'}
    option = Menu::Option.new(option_hash)
    expect(option.name).to eq(option_hash['name'])
    expect(option.price).to eq(option_hash['price'])
  end
end
