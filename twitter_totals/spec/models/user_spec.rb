require 'rails_helper'

describe 'Users' do

  let(:yvette) { User.create(name: 'ynzc') }
  let(:camilla) { User.create(name: 'cnvk') }
  let(:amal) { User.create(name: 'k4kya') }

  it 'have a name' do
    expect(yvette.name).to eq('ynzc')
  end

  context 'new trial scoring system' do

    it 'can get last 100 tweets' do
      expect(yvette.last_cent_tweets.length).to eq(100)
    end

    it 'can get id of last tweet in range' do
      expect(yvette.last_cent_tweet_id).to eq(488712443284439040)
    end

    it 'can get number of non-RT since last cent tweet' do
      expect(yvette.non_rts_in_range).to eq(48)
    end


  end

end
