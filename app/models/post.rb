class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topics

  def self.make_first_post post_data, topic
	Post.create(topic_id: topic, content: post_data[content],
				author_id: @topic.author_id)
  end

end
