class ListsController < ApplicationController


  get '/lists' do
    if logged_in?
      @lists = current_user.lists
      erb :'lists/index'
    else
      redirect to '/login'
    end
  end

  get '/lists/new' do
    if logged_in?
      erb :'lists/new'
    else
      redirect to '/login'
    end
  end

  post '/lists' do
    if params[:name] == ""
      redirect to '/lists/new'
    else
      current_user.lists.create(params)
      redirect to "/lists"
    end
  end
end
