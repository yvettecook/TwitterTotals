require 'rails_helper'

describe 'On the homepage' do

  before do
    visit '/'
  end

  context 'for the basic user flow' do

    it 'there is a welcome' do
      expect(page).to have_content('Welcome! Want to find your twitter narcissism score?')
    end

    it 'there is a prompt to enter a twitter user name' do
      expect(page).to have_content('Click here to find out')
    end

    it 'when a name is submitted, the user stats will be introduced' do
      click_link 'Click here to find out'
      fill_in 'Name', with: 'ynzc'
      click_button 'Create User'
      expect(page).to have_content('Stats for ynzc')
    end

  end

end
