class Topic < ActiveRecord::Base
	belongs_to :forum
	has_many :posts, dependent: :destroy

	def self.make_topic topic_data
		Topic.create(visibility: topic_data[visibility], forum_id: topic_data[forum_id],
					user_id: topic_data[author_id], title: topic_data[title])
	end

end
