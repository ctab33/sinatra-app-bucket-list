class ListsController < ApplicationController

  get '/lists' do
    if logged_in?
      @lists = List.all
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
