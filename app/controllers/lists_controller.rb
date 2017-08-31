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
    if logged_in?
      @list = List.find_by_id(params[:id])
      if @list.user_id == current_user.id
        erb :'/lists/edit'
      else
        redirect to '/lists'
      end
    else
      redirect to '/login'
    end
  end

  patch '/lists/:id' do #edit action
    @list = List.find_by_id(params[:id])
    @list.update(name: params[:name])
    redirect to "/lists/#{@list.id}"
  end

  get '/lists/:id' do
    if logged_in?
     @list = List.find_by_id(params[:id])
     erb :'lists/show'
   else
     redirect to "/login"
   end
  end

 post '/lists' do
   if params[:name] == ""
     redirect to '/lists/new'
   else
     current_user.lists.create(name: params[:name])
     redirect to "/lists"
   end
 end


 get '/lists/:id' do
   @list = List.find_by_id(param[:id])
   erb :'lists/edit'
 end

  delete '/lists/:id/delete' do
    if logged_in?
      @list = List.find(params[:id])
      if @list.user_id == current_user.id
        @list.delete
        redirect to '/lists'
      else
        redirect to '/lists'
      end
    else
      redirect to '/login'
    end
 end

end #end controller
