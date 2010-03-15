class HomeController < ApplicationController

  def index
    @search = Milestone.search(params[:search])
    @milestone_data = params[:search] ? @search.all(:include => :rulemaking, :order=>params[:order]) : []
  end
end
