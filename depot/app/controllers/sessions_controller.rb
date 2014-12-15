class SessionsController < ApplicationController
  skip_before_action :authorize
  before_action :first_user

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_path
    else
      redirect_to login_url, alert: 'Invalid login/password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: 'Logged out'
  end

  #Task I; Login in; playtime #2
  private
    def first_user
      User.create(name: params[:name], password: params[:password]) if User.count.zero?
    end
end
