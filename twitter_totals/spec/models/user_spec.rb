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
      expect(yvette.non_rts_in_range_count).to eq(48)
    end

    it 'can get number of RT since last cent tweet' do
      expect(yvette.rts_in_range_count).to eq(52)
    end

    it 'can calculate percent of retweets' do
      expect(yvette.calculate_retweet_percentage).to eq(52.0)
    end

    it 'can calculate a narcissism score' do
      expect(yvette.calculate_narcissism_score).to eq(9.6)
    end

    it 'has method to report narcissism_score' do
      expect(yvette.narcissism_score).to eq(9.6)
    end



  end

end
