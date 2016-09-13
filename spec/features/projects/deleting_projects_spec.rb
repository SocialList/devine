require 'rails_helper'

feature 'Deleting projects' do

  scenario 'user can delete his own projects' do
    make_project
    click_link 'View project Text editors'
    click_link 'Delete Project'
    expect(page).to have_content 'Successfully deleted project'
  end

  context 'user not owning project' do
    ## tested that then implemented below
    # scenario "user can't delete another user project" do
    #   User.create!(:id => 5)
    #   Project.create!(:repo_id => 11111111, :name => 'new project', :description => "nil", :user_id => 5)
    #   visit '/'
    #   signin
    #   click_link 'Devine'
    #   click_link 'View project new project'
    #   click_link 'Delete Project'
    #   expect(page).to have_content 'You can only delete projects you own'
    # end

    scenario "user can't see a 'Delete Project' link of another user project" do
      User.create!(:id => 5)
      Project.create!(:repo_id => 11111111, :name => 'new project', :description => "nil", :user_id => 5)
      visit '/'
      signin
      click_link 'Devine'
      click_link 'View project new project'
      expect(page).not_to have_link 'Delete Project'
    end
  end

end
