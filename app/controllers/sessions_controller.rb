class SessionsController < ApplicationController
  
  def new
    render layout: false
  end
  
  #ログイン処理
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #ログイン後のページにリダイレクト
      log_in user #sessions_helperでlog_inを定義
      params[:session][:remember_me] == '1'? remember(user):forget(user)
      redirect_to '/static_pages/mypage'
    else
      #エラーメッセージを作成
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in? #sessions_helper
    redirect_to root_url
  end
  
end
