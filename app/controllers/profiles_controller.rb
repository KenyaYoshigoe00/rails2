class ProfilesController < ApplicationController
  def show
  end
  
  def edit
    @profile = current_user
  end
  
  def update
    @profile = current_user
    if params[:user][:user_icon] != nil #画像未選択でも上書きされないように。params[:user]とparams[:user_icon]とparams[:user][:user_icon]はすべて違うもの
      @profile.user_icon.attach(params[:user][:user_icon])
    end
    if @profile.update(params.require(:user).permit(:name, :introduction))
      flash[:notice] = "更新しました"
      redirect_to '/users/profiles/show'
    else
      redirect_to '/users/profiles/edit'
    end
  end
  
end
