require 'rails_helper'

feature '#Posting project' do
  before(:each) do
    OmniAuth.config.mock_auth[:github] = nil
  end
  scenario 'user can post a project' do
    signin
    click_link 'My Repos'
    expect(page).to have_button "Share .atom"
    click_button 'Share .atom'
    expect(page.current_path).to eq "/projects/new"
    fill_in 'Description', with: "These are my atom files"
    click_button 'Create Project'
    expect(page).to have_content 'Project created successfully'
    expect(page).to have_content "These are my atom files"
  end
end
