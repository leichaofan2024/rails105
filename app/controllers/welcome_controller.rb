class WelcomeController < ApplicationController
  def index
    flash[:notice] = "welcome to my world!"
  end 

end
