class AddOauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :string, :oauth_token
    add_column :users, :datetime, :oauth_expires_at
  end
end
