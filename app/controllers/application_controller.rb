class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |e|
    respond_to do |format|
      format.json { render json: {'message':{'text':'권한이 없습니다.'}}, status: :unauthorized }
      format.html { redirect_to bots_path }
    end
  end

  def user_root_path
    bots_path
  end
end
