include Rlocu

RSpec.describe Menu::OptionGroup, '#new' do
  it 'should set the name, text and options' do
    option_group = Menu::OptionGroup.new(menu_option_group)
    expect(option_group.type).to eq(menu_option_group['type'])
    expect(option_group.text).to eq(menu_option_group['text'])
    expect(option_group.options).not_to be_empty
  end
end
