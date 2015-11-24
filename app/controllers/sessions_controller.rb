class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if !@user.nil?
      log_in!
      redirect_to subs_url
    else
      render :new
    end
  end

  def destroy

  end


end
