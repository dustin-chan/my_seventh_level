class Api::SessionsController < ApplicationController

  def create

    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user
      login(@user)
      render :show
    else
      render json: ['Invalid Username and/or Password'], status: 422
    end
  end

  def destroy
    logout
    render json: {}
  end

end