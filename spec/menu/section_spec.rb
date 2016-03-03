include Rlocu

RSpec.describe Menu::Section, '#new' do
  it 'should set section name and subsections' do
    menu_section = Menu::Section.new(menu_section_hash)
    expect(menu_section.section_name).to eq(menu_section_hash['section_name'])
    expect(menu_section.subsections).not_to be_empty
  end
end
