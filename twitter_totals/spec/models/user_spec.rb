require 'rails_helper'

describe User do


  context 'for user with lots of RTs' do

    # yvette { User.new( {:name => username} ) }
    # let(:username) { 'ynzc' }
    let(:yvette) { User.create( name: 'ynzc') }

    it 'has access to the Twitter concern' do
      expect(yvette.say_hi).to eq("HI!")
    end

    # it 'can authenticate with Twitter' do
    #   expect(yvette.twitter_client).to eq({})
    # end

    it 'have a name' do
      expect(yvette.name).to eq('ynzc')
    end

    it 'can get a users full name' do
      expect(yvette.fullname).to eq('Yvette')
    end

    # it 'can get last 100 tweets' do
    #   expect(yvette.last_cent_tweets.length).to eq(100)
    # end

    # it 'can get id of last tweet in range' do
    #   expect(yvette.last_cent_tweet_id).to eq(488712443284439040)
    # end
    #
    # it 'can get number of non-RT since last 100th tweet' do
    #   expect(yvette.non_rts_in_range_count).to eq(48)
    # end
    #
    # it 'can get number of RT since last 100th tweet' do
    #   expect(yvette.rts_in_range_count).to eq(52)
    # end
    #
    # it 'can calculate percent of retweets' do
    #   expect(yvette.calculate_retweet_percentage).to eq(52.0)
    # end
    #
    # it 'can calculate a narcissism score' do
    #   expect(yvette.calculate_narcissism_score).to eq(9.6)
    # end
    #
    # it 'has method to report narcissism_score' do
    #   expect(yvette.narcissism_score).to eq(9.6)
    # end

  end


end
