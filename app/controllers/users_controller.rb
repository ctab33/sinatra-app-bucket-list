class UsersController < ApplicationController

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
      redirect to '/goals'
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
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect to '/lists'
    end
  end

end
