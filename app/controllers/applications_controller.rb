class ApplicationsController < ApplicationController
  before_filter :require_admin, :only => [:index, :show]

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def edit
    @application = Application.find(params[:id])
  end

  def create
    @application = Application.new(params[:application])
    
    if @application.save
      
      session[:last_application_id] = @application.id
      session[:applications] ||= []
      session[:applications] << @application.id
      
      flash.now[:notice] = 'We have recieved your application.'
    else
      render :action => 'new'
    end
  end

  def update
    @application = Application.find(params[:id])

    if @application.update_attributes(params[:application])
      session[:last_application_id] = @application.id
      flash.now[:notice] = 'Your application was successfully updated.'
      render :action => 'create'
    else
      render :action => "edit"
    end
  end

end
