class AddTwitterAccessTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_access_token, :string
  end
end
