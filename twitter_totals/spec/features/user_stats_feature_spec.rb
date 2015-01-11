require 'rails_helper'

describe 'On the stats page' do

  before do
    User.create(:name => 'ynzc', :id => 107)
    visit '/users/107'
  end

  context 'for the basic user flow' do

    it 'there is a welcome' do
      expect(page).to have_content('Stats for ynzc')
    end

    it 'displays total number of followers' do
      expect(page).to have_content('Total followers: 203')
    end

  end

end
