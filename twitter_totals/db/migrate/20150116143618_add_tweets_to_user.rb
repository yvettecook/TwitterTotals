class AddTweetsToUser < ActiveRecord::Migration
  def change
    add_column :users, :tweets, :integer
    add_column :users, :retweets, :integer
    add_column :users, :narcissism_score, :float
  end
end
