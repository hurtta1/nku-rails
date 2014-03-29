class UploadsController < ApplicationController
  before_action :isAdmin
  
  def index
  end
  
  def create
    require 'csv'
    
    if(params[:file] == nil)
      flash[:error] = "Please choose a valid file"
      redirect_to uploads_path
    else    
      @inputFile = params[:file]
      @assignments = Assignment.upload(@inputFile)
      redirect_to assignments_path, :notice => @assignments.to_s + " Assignments uploaded successfully"
    end
  end
end