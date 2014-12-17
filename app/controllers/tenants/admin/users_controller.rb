class Admin::UsersController < Admin::BaseAdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_webmaster
  layout 'admin'

  def index
    @users = User.all
  end

  def show
    get_roles
    @roles = Role.all
  end

  def new
    @roles = Role.all
    @user = User.new
  end

  def edit
    @roles = Role.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User created. Please log in."
    else
      flash.now[:notice] = "User could not be created."
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      @user.role_ids = params[:user][:role_ids]
      redirect_to admin_user_path(@user), notice: "You have updated a user."
    else
      flash.now[:alert] = "The user was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "The user was deleted."
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email, :username, :password, :password_confirmation, :role_ids)
  end

  def get_roles
    user = User.find(params[:id])
    @user_roles = user.roles.map(&:name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
