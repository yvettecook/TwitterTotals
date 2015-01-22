require 'rails_helper'

describe User do

  subject { User.last }

  context 'tests accessing the API, with real data' do

    before(:context) { described_class.create(name: 'ynzc') }

    it 'has access to the Twitter concern' do
      expect(subject.say_hi).to eq("HI!")
    end

    it 'have a name' do
      expect(subject.name).to eq('ynzc')
    end

    it 'can get a users full name' do
      expect(subject.fullname).to eq('Yvette')
    end

    it 'can get last 100 tweets of a user' do
      expect(subject.twitter_client).to receive(:user_timeline).and_return(Array.new(100))
      expect(subject.last_cent_tweets.length).to eq(100)
    end

    it 'can get id of last tweet in range' do
      expect(subject).to receive(:last_cent_tweet_id).and_return(488712443284439040)
      expect(subject.last_cent_tweet_id).to eq(488712443284439040)
    end

    it 'can get number of non-RT since last 100th tweet' do
      expect(subject.tweets).to eq(48)
    end

    it 'can get number of RT since last 100th tweet' do
      expect(subject.retweets).to eq(52)
    end

    it 'can calculate percent of retweets' do
      expect(subject.calculate_retweet_percentage).to eq(52.0)
    end

    it 'has method to report narcissism_score' do
      expect(subject.narcissism_score).to eq(9.6)
    end

  end

end
