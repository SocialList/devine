require 'rails_helper'

feature 'Viewing individual project' do
  scenario 'user can view a single project' do
    visit '/'
    signin
    make_project
    expect(page).to have_link 'View project Text editors'
    click_link 'View project Text editors'
    expect(current_path).to eq '/projects/text-editors'
    expect(page).to have_content 'These are my atom files'
  end
end
