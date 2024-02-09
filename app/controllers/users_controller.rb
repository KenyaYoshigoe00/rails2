class UsersController < ApplicationController
  def index
    
  end
  
  def account
    
  end
  
  def account_edit
    #@user = current_user.id
  end
  
  def update
    @profile = current_user
    @profile.user_icon.attach(params[:user][:user_icon]) #if @profile.user_icon.blank?
    if @profile.update(params.require(:user).permit(:name, :introduction))
      flash[:notice] = "更新しました"
      redirect_to '/users/profiles/show'
    else
      render '/users/profiles/edit'
    end
  end
  
end
