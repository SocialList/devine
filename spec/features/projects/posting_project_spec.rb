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

  context 'project was posted' do
    scenario 'user cannot add his repo to another project' do
      signin
      make_project
      expect{Project.create!(:repo_id => 66507460, :name => 'new project', :description => "nil")}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Repo has already been taken")
    end
  end
end
