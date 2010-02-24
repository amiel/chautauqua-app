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
      flash[:notice] = 'Application was successfully created.'
      redirect_to(@application)
    else
      render :action => "new"
    end
  end

  def update
    @application = Application.find(params[:id])

    if @application.update_attributes(params[:application])
      flash[:notice] = 'Application was successfully updated.'
      redirect_to(@application)
    else
      render :action => "edit"
    end
  end

end
