class AddAdminToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :permission_level, :integer, { default: 4 }
  end
end
