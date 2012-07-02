class PageController < ApplicationController
  def home
  	if user_signed_in?
  		@assets = current_user.assets.order("uploaded_file_file_name desc")
  	end
  end

  def about
  end

  def contact_us
  end

  
end
