class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
    
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: %i(avatar))
    end

    def set_search
      @search = Room.ransack(params[:q]) #ビューファイルから送られてくるパラメーター
      @search.build_condition(adress_cont: params[:adress_cont]) if params[:adress_cont].present?
      #build_condition メソッドは、指定された条件を @search オブジェクトに追加する。
      @rooms = @search.result
      #@search.result は、検索条件に基づいて実際の検索を行い、結果を取得する。
      #@rooms 変数には、検索結果が格納される。


    end
  




   
    
    
end

