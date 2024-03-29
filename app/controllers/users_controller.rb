class UsersController < ApplicationController
 before_action :logged_in_user, only: [:show, :edit, :update, :index, :destroy]
 before_action :correct_user,   only: [:show, :edit, :update]
 before_action :admin_user,     only: [:destroy, :index]

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      log_in @user
      flash[:success] = "登録されました"
      redirect_to @user

    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id:params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "登録されました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "消去しました"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end



    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
