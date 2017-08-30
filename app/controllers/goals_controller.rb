class GoalsController < ApplicationController
  get '/goals' do
    @goals = Goal.find_by_id(params[:id])
    erb :'list/index'
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

  patch '/goals/:id/' do
    @goal = Goal.find(params[:id])
    @goal.update(name: params[:name])
    redirect to "/goals/#{@goal.id}"
  end

  

end
