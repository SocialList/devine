require 'rails_helper'

feature '#Posting project' do
  before(:each) do
    OmniAuth.config.mock_auth[:github] = nil
  end
  scenario 'user can post a project' do
    signin
    make_project
    expect(page).to have_content 'Project created successfully'
    expect(page).to have_content "These are my atom files"
  end
end
