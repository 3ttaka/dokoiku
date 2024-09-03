class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def show
    
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      sign_in(@user, bypass: true)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @shops = current_user.reviews.includes(:shop).map(&:shop).uniq
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :gender_id, :age_group_id, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
