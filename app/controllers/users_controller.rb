class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  include BCrypt

  def show; end

  def update
    if Password.new(@user.encrypted_password) != params[:user].delete(:current_password)
      flash.alert = t('.incorrect_password')
      @user.update(user_params)
      @user.errors.add(:current_password, :incorrect)
      render :edit
    elsif @user.update(user_params)
      flash.notice = t('.user_save_successful')
      redirect_to user_params[:password].present? ? new_user_session_path : user_path(@user)
    else
      flash.alert = t('.user_save_unsuccessful')
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation, :current_password, :locale, :first_name, :last_name, :age
    )
  end

  def load_user
    if !current_user || params[:id].to_i != current_user.id
      redirect_to(root_path, alert: t('.no_write_permissions')) unless params[:action] == 'show'
    else
      @user = current_user
    end
  end
end
