class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :mypage]
  
  def home
    render layout: false
  end

  def about
    render layout: false
  end
  
  def sample
  end
  
  def mypage
    if logged_in?
      # @microposts = current_user.microposts.paginate(page: params[:page])
      @feed_items = current_user.feed.paginate(page:params[:page])
    end
  end
  
  def profile
    @microposts = current_user.microposts.paginate(page: params[:page])
  end
  
end