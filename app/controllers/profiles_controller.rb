class ProfilesController < ApplicationController
  def show
  end
  
  def edit
    @profile = current_user
  end
  
  def update
    @profile = current_user
    if @profile.update(params.require(:user).permit(:name, :introduction))
      flash[:notice] = "更新しました"
      redirect_to :back
    else
      render '/users/profiles/edit'
    end
  end
  
end
