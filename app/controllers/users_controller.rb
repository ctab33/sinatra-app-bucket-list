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
      redirect to 'goals'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/lists'
    else
      redirect to 'signup'
    end
  end

  post '/signup' do #check validation before submitting 
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect to '/lists'
  end

end
