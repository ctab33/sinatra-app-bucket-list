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

  get '/lists/:id/edit' do #load edit form
    @list = List.find_by_id(params[:id])
    erb :'/lists/edit'
  end

  post '/lists' do
    if params[:name] == ""
      redirect to '/lists/new'
    else
      current_user.lists.create(params)
      redirect to "/lists"
    end
  end

  get '/lists/:id' do
    @list = List.find_by_id(params[:id])
    erb :'lists/edit'
  end

  delete '/lists/:id' do
    @list = List.find_by_id(params[:id])
    @list.destroy
    redirect to '/lists'
  end

  patch '/lists/:id' do #edit action
    @list = List.find_by_id(params[:id])
    @list.name = params[:title]
    @list.save
    redirect to "/lists/#{@list.id}"
  end 

end
