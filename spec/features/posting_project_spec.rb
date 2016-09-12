require 'rails_helper'

feature '#Posting project' do
  before(:each) do
    OmniAuth.config.mock_auth[:github] = nil
  end
  scenario 'user can post a project' do
    raw_response_file = File.new("./spec/support/example_curl_output.txt")
    api_response_file = File.new("./spec/support/api_curl_output.txt")

    stub_request(:get, "https://api.github.com/user/repos").
             with(:headers => {'Accept'=>'application/vnd.github.v3+json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'token 123456', 'Content-Type'=>'application/json', 'User-Agent'=>'Octokit Ruby Gem 4.3.0'}).
             to_return(raw_response_file)

   stub_request(:get, "https://api.github.com/repositories/66507460").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'api.github.com', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {}).to_return(api_response_file)

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
