class SearchesController < ApplicationController
  
  def new
  end
  
  def index
    if params[:keyword].present?
      @users = User.where('name LIKE ?', "%#{params[:keyword]}%")
    else
      @users = User.none
    end
  end
end
