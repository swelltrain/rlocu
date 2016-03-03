include Rlocu

RSpec.describe Menu::SectionText, '#new' do
  it 'should set type and text' do
    menu_section_text = Menu::SectionText.new(menu_section_text_hash)
    expect(menu_section_text.type).to eq(menu_section_text_hash['type'])
    expect(menu_section_text.text).to eq(menu_section_text_hash['text'])
  end
end
