class MicropostsController < ApplicationController
  
  before_action :logged_in_user,only:[:create,:destroy]
  before_action :correct_user, only: :destroy
  
  def new
    @title = params[:api_title]
    @address = params[:api_address]
    @micropost = current_user.microposts.build if logged_in?
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to '/static_pages/mypage'
    else
      render 'microposts/new'
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || "/static_pages/home"
  end
  
  private
    def micropost_params
      params.require(:micropost).permit(:title, :address, :point, :content, :image)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id:params[:id])
      redirect_to '/static_pages/home' if @micropost.nil?
    end

end
