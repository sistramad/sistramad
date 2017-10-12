class WelcomeController < ApplicationController
  def index
    add_breadcrumb "home", authenticated_root_path
  end
  
end
