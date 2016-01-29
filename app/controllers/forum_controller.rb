class ForumController < ApplicationController

	def index
		@visible_forums = Forum.get_visible_forums permission
	end

	def show
		@forum = Forum.find_by id: params[:id]
		@topics = Topic.where forum_id: params[:id]
	end

end