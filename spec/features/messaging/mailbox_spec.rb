require 'rails_helper'

feature 'Mailbox' do
  context 'User not signed in: ' do
    scenario 'user cannot access Mailbox without signing in' do
      expect(page).not_to have_link 'Start conversation'
    end
  end

  context 'User signed in: ' do
    before do
      signin
    end
    scenario 'user can access his Mailbox if signed in' do
      click_link 'INBOX'
      expect(page).to have_link 'Start conversation'
    end

    scenario 'user can sent a message' do
      send_message
      expect(page).to have_content 'Message has been sent!'
    end

    scenario 'user can reply to a message' do
      send_message
      fill_in 'body', with: 'Test reply'
      click_button 'Send Message'
      expect(page).to have_content 'Reply sent'
    end

    scenario 'user can delete a conversation' do
      send_message
      click_link 'INBOX'
      click_link 'Move to trash'
      expect(page).to have_content 'The conversation was moved to trash'
    end

    scenario 'user can access sent messages' do
      send_message
      click_link 'INBOX'
      click_link 'Sent'
      expect(page).to have_content 'Test subject'
    end
  end


end
