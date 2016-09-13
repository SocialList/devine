require 'rails_helper'

feature 'Updating a project' do
  scenario 'user can update a project' do
    visit '/'
    signin
    make_project
    click_link 'View project .atom'
    click_link 'Edit Project'
    fill_in 'Description', with: 'Whatever!'
    click_button 'Update Project'
    expect(page).to have_content 'Whatever!'
  end
end
