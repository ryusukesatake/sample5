class AddGenreToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :genre, :integer
  end
end
