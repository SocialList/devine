require 'rails_helper'

feature 'Updating a project' do
  scenario 'user can update a project' do
    visit '/'
    make_project
    click_link 'View project Text editors'
    click_link 'Edit Project'
    fill_in 'Description', with: 'Whatever!'
    click_button 'Update Project'
    expect(page).to have_content 'Whatever!'
  end

context 'visitor' do
  ## tested that then the next one
  # scenario 'user can not update a project' do
  #   User.create!(:id => 5)
  #   Project.create!(:repo_id => 11111111, :name => 'new project', :description => "DELETE", :user_id => 5)
  #   visit '/'
  #   signin
  #   click_link 'Devine'
  #   click_link 'View project new project'
  #   click_on('Edit Project')
  #   expect(page).to have_content 'You can only edit projects you own'
  # end

  scenario "user can't see Edit Project link" do
    User.create!(:id => 5)
    Project.create!(:repo_id => 11111111, :name => 'new project', :description => "DELETE", :user_id => 5)
    visit '/'
    signin
    click_link 'Devine'
    click_link 'View project new project'
    expect(page).not_to have_link "Edit Project"
  end
end
end
