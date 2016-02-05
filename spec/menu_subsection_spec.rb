include Rlocu

RSpec.describe Menu::Subsection, '#new' do
  it 'should set subsection_name and contents' do
    menu_subsection = Menu::Subsection.new(menu_subsection_hash)
    expect(menu_subsection.subsection_name).to eq(menu_subsection_hash['subsection_name'])
    expect(menu_subsection.contents).not_to be_empty
  end
end
