class GoalsController < ApplicationController
  get '/goals' do
    @goals = Goal.find_by_id(params[:id])
    erb :'list/index'
  end

  get '/goals/new' do
    @lists = current_user.lists
    erb :'goals/new'
  end
end
