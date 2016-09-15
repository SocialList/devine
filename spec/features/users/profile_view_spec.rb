require 'rails_helper'

feature 'View Profiles'do
  scenario 'user can view projects of other users in devs' do
    User.create!(:id => 5, :name => 'Bob')
    Project.create!(:repo_id => 11111111, :name => "new project", :description => "DELETE", :user_id => 5)
    visit '/'
    signin
    click_link 'Devs'
    click_link 'Bob'
    expect(page).to have_selector("ul","projects")
    click_link 'new project'
    save_and_open_page
    expect(page).to have_content('tts-datamaster-ee-crack')
    expect(page).to have_content('DELETE')
  end
end
