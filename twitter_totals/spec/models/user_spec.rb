require 'rails_helper'

describe 'Users' do

  let(:yvette) { User.create(name: 'ynzc') }
  let(:camilla) { User.create(name: 'cnvk') }

  it 'have a name' do
    expect(yvette.name).to eq('ynzc')
  end

  it 'can get number of followers for an account' do
    expect(yvette.followers_count).to eq(203)
  end

  it 'can get number of followering for an account' do
    expect(yvette.following_count).to eq(534)
  end

  it 'can get total number of tweets' do
    expect(yvette.tweets_count).to eq(505)
  end

  it 'can get total number of retweets' do
    expect(camilla.retweets_check).to eq(2)
  end

  it 'can return total tweets since first retweet in range' do
    expect(yvette.own_tweets_count).to eq(87)
  end

end
