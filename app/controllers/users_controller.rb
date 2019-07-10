class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end
end
