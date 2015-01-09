require 'rails_helper'

describe 'On the homepage' do

  it 'there is a prompt to enter a twitter user name' do
    visit '/'
    expect(page).to have_content('Enter twitter username:')
  end

  it 'there is a box to enter a username' do
    visit '/'
    expect(page).to have_css('input')
  end

end
