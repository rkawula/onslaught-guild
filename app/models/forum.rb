class Forum < ActiveRecord::Base
	has_many :topics

	def self.get_visible_forums permission
		Forum.where("visibility > ?", permission - 1)
	end
end
