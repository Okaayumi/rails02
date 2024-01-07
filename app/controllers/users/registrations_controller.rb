# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_user! 
    #ユーザーが認証澄香どうか

  def edit_profile

    @user = current_user
    @image_name = @user.image_name.present? ? @user.image_name : 'avatar.png'

    render 'edit_profile'
   
  end

  #def update
    #super do |resource|

      #if params[:user].present? && params[:user][:image_name].present?
        #resource.update(user_params)
        

      #end
    #end
  #end

  #private

  #def user_params
    #params.require(:user).permit(:image_name)

  #end

  #protected

  #def after_update_path_for(resource)
    #user_profile_path
  #end
  #上記はコメント中
  #def edit_email
    # メール変更画面の表示
    #render 'devise/edit_email'# deviseフォルダ内のedit_email.html.erbを表
  #end

 # def update_email
    # メールの更新処理
 # end

 # def edit_password
    # パスワード変更画面の表示
 # end

 # def update_password
    # パスワードの更新処理
#  end


  # GET /resource/sign_up
  #def new
  
  #  super
    
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  #protected


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
