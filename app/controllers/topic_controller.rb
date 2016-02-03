class TopicController < ApplicationController

	def show
		@topic = Topic.find params[:id]
		@posts = Post.where topic_id: @topic
	end

end