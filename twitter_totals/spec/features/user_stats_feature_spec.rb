require 'rails_helper'

describe 'On the stats page' do

  before :context do
    User.create(:name => 'ynzc', :id => 107)
  end

  context 'for the basic stats' do

    before :each do
      visit '/users/107'
    end

    it 'there is a welcome' do
      expect(page).to have_content('Stats for ynzc')
    end

    it 'displays number of tweets' do
      expect(page).to have_content('Number of tweets: 48')
    end

    it 'displays number of retweets' do
      expect(page).to have_content('Number of retweets: 52')
    end

    it 'displays narcissim score' do
      expect(page).to have_content('Narcissism score: 9.6')
    end

  end

end
