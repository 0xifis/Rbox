class PageController < ApplicationController
  def home
  	if user_signed_in?
  		@folders = current_user.folders.roots
  		@assets = current_user.assets.where("folder_id is NULL").order("uploaded_file_file_name desc")
  	end
  end

  def about
  end

  def contact_us
  end

  def browse
    @current_folder = current_user.folders.find(params[:folder_id])    
  
    if @current_folder  
      @folders = @current_folder.children    
      @assets = @current_folder.assets.order("uploaded_file_file_name desc")
      render :action => "home"  
    else  
      flash[:error] = "Hello boss, if not yours den why you want!"  
      redirect_to root_url  
    end  
  end
  
end
