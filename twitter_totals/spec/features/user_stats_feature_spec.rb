require 'rails_helper'

describe 'On the stats page' do

  before do
    User.create(:name => 'ynzc', :id => 107)
    visit '/users/107'
  end

  context 'for the basic stats' do

    it 'there is a welcome' do
      expect(page).to have_content('Stats for ynzc')
    end

    it 'displays narcissim score' do
      expect(page).to have_content('Narcissism score: 9.6')
    end

  end

end
