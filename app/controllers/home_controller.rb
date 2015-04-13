class HomeController < ApplicationController
  def index
	if logged_in?
      @run = current_user.runs.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
end
