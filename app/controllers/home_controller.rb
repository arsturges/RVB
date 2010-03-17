class HomeController < ApplicationController

  def index
    @search = Milestone.search(params[:search])
    @milestone_data = params[:search] ? @search.all(:include => [:rulemaking, :phase, :activity, :date_category], :order=>params[:order]) : []
  end
end
