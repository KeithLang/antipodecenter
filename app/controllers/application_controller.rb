class ApplicationController < ActionController::Base


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



###### This section redirects any misspelled URLs to the root path #####
rescue_from ActionView::MissingTemplate, :with => :template_not_found

  private

  def template_not_found
    redirect_to root_path
  end
###### END section redirects any misspelled URLs to the root path #####  

end
