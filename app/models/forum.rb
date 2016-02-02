class Forum < ActiveRecord::Base
	has_many :topics

	def self.get_visible_forums permission
		Forum.where("visibility > ?", permission - 1)
	end

	def self.new_topic post_data, topic_data
		@topic = Topic.make_topic(topic_data)
		@post = Post.make_first_post(post_data, @topic.id)
		return @topic
	end


end
