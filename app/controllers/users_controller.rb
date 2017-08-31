require 'rack-flash'

class UsersController < ApplicationController
#use Rack::Flash

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
    redirect to '/lists'
    end
  end

  get '/signup' do
    if !logged_in?
      erb :'users/new'
    else
      redirect to '/lists'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to 'login'
    else
      redirect to '/'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/lists'
    else
      redirect to '/signup'
    end
  end

  post '/signup' do #check validation before submitting
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/lists/new'
    else
      redirect to '/signup'
    end
  end

end
