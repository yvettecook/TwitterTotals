require 'rails_helper'

describe User do

  subject{ described_class.new(name: username) }

  context 'for user with lots of RTs' do

    let(:username) { 'ynzc' }

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
      expect(subject.last_cent_tweet_id).to eq(488712443284439040)
    end

    it 'can get number of non-RT since last 100th tweet' do
      expect(subject.non_rts_in_range_count).to eq(48)
    end

    it 'can get number of RT since last 100th tweet' do
      expect(subject.rts_in_range_count).to eq(52)
    end

    it 'can calculate percent of retweets' do
      expect(subject.calculate_retweet_percentage).to eq(52.0)
    end

    it 'has method to report narcissism_score' do
      expect(subject.narcissism_score).to eq(9.6)
    end

  end

  context 'for user with lots of RTs' do

    let(:username) { 'k4kya' }


    it 'can get a users full name' do
      expect(subject.fullname).to eq('Amal Kakaiya')
    end

    it 'can get last 100 tweets of a user' do
      expect(subject.last_cent_tweets.length).to eq(100)
    end

    it 'can get id of last tweet in range' do
      expect(subject.last_cent_tweet_id).to eq(325812114453307393)
    end

    it 'can get number of non-RT since last 100th tweet' do
      expect(subject.non_rts_in_range_count).to eq(79)
    end

    it 'can get number of RT since last 100th tweet' do
      expect(subject.rts_in_range_count).to eq(21)
    end

    it 'can calculate percent of retweets' do
      expect(subject.calculate_retweet_percentage).to eq(21.0)
    end

    it 'has method to report narcissism_score' do
      expect(subject.narcissism_score).to eq(4.199999999999999)
    end

  end


end
