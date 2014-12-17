class Tenants::SessionsController < ApplicationController
  before_action :set_items

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :back, notice: "Welcome to Los Amigos Gordos, #{user.first_name}."
     else
      flash[:error] = true
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:alert] = true
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
