include Rlocu

RSpec.describe Menu::OptionGroup, '#new' do
  it 'should set the name, text and options' do
    options = [{'name' => 'spec', 'price' => '1'}]
    option_group_hash = {'type' => 'spec', 'text' => 'foo', 'options' => options}
    option_group = Menu::OptionGroup.new(option_group_hash)
    expect(option_group.type).to eq(option_group_hash['type'])
    expect(option_group.text).to eq(option_group_hash['text'])
    expect(option_group.options).not_to be_empty
  end
end
