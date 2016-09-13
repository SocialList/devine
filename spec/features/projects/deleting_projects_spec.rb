require 'rails_helper'

feature 'Deleting projects' do
  scenario 'user can delete his own projects' do
    visit '/'
    signin
    make_project
    click_link 'View project Text editors'
    click_link 'Delete Project'
    expect(page).to have_content 'Successfully deleted project'
  end
end
