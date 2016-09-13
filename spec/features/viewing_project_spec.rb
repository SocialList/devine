require 'rails_helper'

feature 'Viewing individual project' do
  scenario 'user can view a single project' do
    visit '/'
    signin
    make_project
    expect(page).to have_link 'View project .atom'
    click_link 'View project .atom'
    expect(page.current_path).to eq '/projects/2'
    expect(page).to have_content 'These are my atom files'
  end
end
