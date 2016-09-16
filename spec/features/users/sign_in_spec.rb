# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :omniauth do
  before(:each) do
    OmniAuth.config.mock_auth[:github] = nil
  end

  # Scenario: User can sign in with valid account
  #   Given I have a valid account
  #   And I am not signed in
  #   When I sign in
  #   Then I see a success message
  scenario "user can sign in with valid account" do
    signin
    expect(page).to have_content("SIGNOUT")
  end

  # Scenario: User cannot sign in with invalid account
  #   Given I have no account
  #   And I am not signed in
  #   When I sign in
  #   Then I see an authentication error message
  scenario 'user cannot sign in with invalid account' do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
    visit root_path
    expect(page).to have_content("GITHUB LOGIN")
    click_link "GITHUB LOGIN"
    expect(page).to have_content('Authentication error')
  end

end
