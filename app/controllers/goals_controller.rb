class GoalsController < ApplicationController
  get '/goals' do
    #@lists = current_user.lists
    @goals = Goal.find_by_id(params[:id])
    erb :'goals/index'
  end

  get '/goals/new' do
    @lists = current_user.lists
    erb :'goals/new'
  end


  get '/goals/:id/edit' do
    @goal = Goal.find(params[:id])
    @lists = current_user.lists
    erb :'goals/edit'
  end

  patch '/goals/:id' do
    @goal = Goal.find(params[:id])
    @goal.update(name: params[:name])
    redirect to "/goals/#{@goal.id}"
  end

  get '/goals/:id' do
    @goal = Goal.find_by_id(params[:id])
    erb :'goals/show'
  end

  post '/goals' do
    current_user.goals.create(name: params[:name])
    redirect to "/goals"
  end

  get '/goals/:id' do
    @goal = Goal.find_by_id(params[:id])
    erb :'/goals/edit'
  end

  delete '/goals/:id' do
    @goal = Goal.find_by_id(params[:id])
    @goal.delete
    redirect '/goals'
  end


end
