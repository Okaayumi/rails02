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

    end

    def update
  
      super do |resource|
  
        if params[:user].present? && params[:user][:image_name].present?
          resource.update(user_params)
          
  
        end
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:image_name)
  
    end
  
    protected
  
    def after_update_path_for(resource)
      user_profile_path
    end
end
  

    
