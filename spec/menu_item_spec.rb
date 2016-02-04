include Rlocu

RSpec.describe Menu::Item, '#new' do
  it 'should set type, name, description, price and option groups' do
    item = Menu::Item.new(item_hash)

    expect(item.type).to eq(item_hash['type'])
    expect(item.name).to eq(item_hash['name'])
    expect(item.description).to eq(item_hash['description'])
    expect(item.price).to eq(item_hash['price'])
    expect(item.option_groups).not_to be_empty
  end
end
