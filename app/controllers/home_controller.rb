class HomeController < ApplicationController

  def index
    @search = Milestone.search(params[:search])
    @started = Milestone.find(:all, :conditions => ["date_category_id = 5 AND milestone < ?  ", Date.today])
    @underway = @search.all( :conditions => ["date_category_id = 6 AND milestone < ?  AND milestone > ?", 2.months.from_now, Date.today])
    
                                      #                :include => [:rulemaking, :phase, :activity, :date_category]
    @current = []
    @underway.each do |um|
    @current << um if @started.detect {|sm| sm.rulemaking_id = um.rulemaking_id  && sm.phase_id = um.phase_id && sm.activity_id = um.activity_id }
        end
    @planned_starts = Milestone.find(:all, :conditions => {:date_category_id => 2})

  end

  def search
       @search = Milestone.search(params[:search])
    @milestone_data = params[:search] ? @search.all(:include => [:rulemaking, :phase, :activity, :date_category]) : []



  end

end
