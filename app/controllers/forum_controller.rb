class ForumController < ApplicationController

	def index
		@visible_forums = Forum.get_visible_forums permission
	end

	def show
	end

end
