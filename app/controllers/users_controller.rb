class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index, :show]

  def index
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  end

  def show
    @user = User.find(params[:id])
  end

end
