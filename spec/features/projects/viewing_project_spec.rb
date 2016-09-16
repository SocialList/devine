require 'rails_helper'

feature 'Viewing individual project' do
  scenario 'user can view a single project' do
    visit '/'
    make_project
    expect(page).to have_link 'View project Text editors'
    click_link 'View project Text editors'
    expect(current_path).to eq '/projects/text-editors'
    expect(page).to have_content 'These are my atom files'
  end



  scenario 'Users can contact owner with link on page' do
    User.create!(:id => 6)
    # User.create!(:id => 7)
    Project.create!(:repo_id => 91437971, :name => 'This is a long project name', :description => "nil", :user_id => 6)
    visit '/'
    signin
    click_link 'View project This is a long project name'
    click_link 'ContactOwner'
    fill_in 'message_subject', with: 'Hi'
    fill_in 'Message', with: 'Nice'
    click_on 'Send'
    expect(page).to have_content 'Message has been sent!'
  end
end
