require 'rails_helper'

describe 'On the homepage' do

  before do
    visit '/'
  end

  it 'there is a prompt to enter a twitter user name' do
    expect(page).to have_content('Enter twitter username:')
  end

  it 'there is a box to enter a username' do
    expect(page).to have_css('#username_input')
  end

  it 'when a name is submitted, the user stats will be introduced' do
    fill_in 'username_input', with: 'ynzc'
    click_button 'Submit'
    expect(page).to have_content('Stats for ynzc')
  end

end
