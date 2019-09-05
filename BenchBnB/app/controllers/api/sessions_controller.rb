class Api::SessionsController < ApplicationController
  
  def create
    user = User.find_by_credentials(
      params[:user][:username], 
      params[:user][:password]
    )
    if user.nil?
      render json: ["username/password incorrect"], status: 404
    else
      login(user)
      render "api/users/show"
    end
  end

  def destroy
    if logged_in?
      logout 
      render "api/users/show"
    else
      render json: ["Not logged in"], status: 404 
    end
  end
end
