class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
    end
  
    def profile
      
      @user = current_user
    end
      
      
    def account
      
      @user = current_user
     
    end

    def edit
      @user = User.find(prams[:id])

    end

    def update_profile
      @user = User.find(params[:id])
    
      if @user.update(params.require(:user).permit(:name, :image_name,:self_introduction))

        flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
        redirect_to users_profile_path
      else
        render "edit/profile"
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :self_introduction, :image_name)
    end
     

end
  

    
