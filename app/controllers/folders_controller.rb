class FoldersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @folders = current_user.folders
  end

  def show
    @folder = current_user.folders.find(params[:id])
  end

  def new
    @folder = current_user.folders.new
    if params[:folder_id]
      @current_folder = current_user.folders.find(params[:folder_id])
      @folder.parent_id = @current_folder.id
    end
  end

  def create
    @folder = current_user.folders.new(params[:folder])
    if @folder.save
      redirect_to browse_url(@folder), :notice => "Successfully created folder."
    else
      render :action => 'new'
    end
  end

  def edit
    @folder = current_user.folders.find(params[:folder_id]) 
    @current_folder = @folder.parent     
  end

  def update
    @folder = current_user.folders.find(params[:id])
    if @folder.update_attributes(params[:folder])
      redirect_to browse_url(@folder), :notice  => "Successfully updated folder."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @folder = current_user.folders.find(params[:id])
    @former_parent = @folder.parent_id
    @folder.destroy
    if @former_parent
      redirect_to browse_url(@former_parent), :alert => "Successfully destroyed folder."
    else
      redirect_to root_url, alert: "Successfully destroyed folder."
    end
  end
end
