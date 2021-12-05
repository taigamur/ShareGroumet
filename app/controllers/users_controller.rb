class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]  
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
    render layout: false
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to '/static_pages/mypage'
    else
      render 'new'
    end
  end

  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.image.attach(params[:image])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to static_pages_profile_url
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to '/static_pages/home'
  end
  
  def following
    @title = "フォロー中"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  
  
  # privateにすることで、外部から使用できない
  private
    # userの一部を取得する　:userが必須　それ以外は許可
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :image)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    #管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end
