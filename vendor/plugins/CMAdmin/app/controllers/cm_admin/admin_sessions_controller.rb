module CMAdmin
  class AdminSessionsController < ApplicationController
    include CMAdmin::Controller

    def new
      @admin_session = AdminSession.new
    end

    def create
      @admin_session = AdminSession.new(params[:admin_session])
      if @admin_session.save
        flash[:notice] = I18n.t(:'flashes.cm_admin.admin_sessions.create.notice')
        redirect_back_or_default cm_admin_account_url
      else
        render :action => :new
      end
    end

    def destroy
      current_admin_session.destroy
      flash[:notice] = I18n.t(:'flashes.cm_admin.admin_sessions.destroy.notice')
      redirect_to root_path
    end
  end
end