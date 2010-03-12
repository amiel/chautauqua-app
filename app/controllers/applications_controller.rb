class ApplicationsController < ApplicationController
  include CMAdmin::Controller
  layout 'application'
  
  before_filter :require_admin, :only => [:index, :show, :only_new]
  
  before_filter :need_applications_session
  before_filter :require_application_from_current_session, :only => [:edit, :update, :complete]

  def index
    @applications = Application.newest_first.all
  end

  def show
    @application = Application.find(params[:id])
  end
  
  def only_new
    @applications = Application.only_new.newest_first.all
    render :index
  end

  def new
    @application = Application.new
  end

  def edit
    @application = Application.find(params[:id])
  end
  
  def complete
    @application = Application.find(params[:id])
  end
  
  def create
    @application = Application.new(params[:application])
    
    if @application.save
      
      session[:last_application_id] = @application.id
      session[:applications] << @application.id
      
      flash[:notice] = 'We have recieved your application.'
      redirect_to :action => 'complete', :id => @application
    else
      render :action => 'new'
    end
  end

  def update
    @application = Application.find(params[:id])

    if @application.update_attributes(params[:application])
      session[:last_application_id] = @application.id
      flash[:notice] = 'Your application was successfully updated.'
      redirect_to :action => 'complete', :id => @application
    else
      render :action => "edit"
    end
  end

  private
  
  def need_applications_session
    session[:applications] ||= []
    @saved_applications = Application.find session[:applications]
  rescue ActiveRecord::RecordNotFound => e
    session[:applications] = []
    @saved_applications = []
  end
  
  def require_application_from_current_session
    redirect_to root_path unless session[:applications].include?(params[:id].to_i)
  end
end
