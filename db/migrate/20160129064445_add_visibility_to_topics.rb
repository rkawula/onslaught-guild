class AddVisibilityToTopics < ActiveRecord::Migration
  def change
  	add_column :topics, :visibility, :integer, { default: 0 }
  end
end
