class TopsController < ApplicationController

  def index
    @user = User.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new 
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :last_name_furigana, :first_name_furigana, :birth_day).merge(user_id: current_user.id)
  end
end
