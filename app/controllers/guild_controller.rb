class GuildController < ApplicationController
  protect_from_forgery with: :exception
  def index
  	render text: "Hello world!"
  end
end
