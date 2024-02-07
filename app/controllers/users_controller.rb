class UsersController < ApplicationController

    def show
      @user = current_user #User.find(params[:id])
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
      @user = current_user #find(params[:id])の代わり
    
      if @user.update(user_params)
        # 更新が成功した場合の処理
        flash[:notice] = "ユーザーIDが「#{current_user.id}」の情報を更新しました"
        redirect_to user_profile_url
        # 更新が失敗した場合の処理
      else
        render "edit"
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :image_name, :self_introduction)
    end
     

end
  

    
