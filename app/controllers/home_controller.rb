class HomeController < ApplicationController

  def index
    #@final_rules = Milestone.find(:all) # find all milestones with any final rule activities within less than six months)
    #@federal_registers = Milestone.find(:all, :conditions => ['activity_id = ? AND milestone > ? AND milestone < ?', Activity.fed_reg_pub.id, Time.now, 1.year.from_now])  #find all milestones with federal reg dates in less than six months)

    @search = Milestone.search(params[:search])
    @federal_registers = params[:search] ? @search.all(:include => :rulemaking, :order=>params[:order]) : []
  end

end
