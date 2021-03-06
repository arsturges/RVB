class HomeController < ApplicationController

  def index
    @search = Milestone.search(params[:search])
    @started = Milestone.find(:all, :include => [:rulemaking, :phase, :task, :date_category], :conditions => ["date_category_id = 5 AND milestone < ?  ", Date.today])
    @underway = @search.all( :include => [:rulemaking, :phase, :task, :date_category, :revision], :conditions => ["date_category_id = 6 AND milestone > ?  AND milestone < ? AND milestones.revision_number = ?", Date.today, 2.months.from_now, Revision.maximum(:revision_number) ])

    @current = []
    @underway.each do |um|
    @current << um if @started.detect {|sm| sm.rulemaking_id = um.rulemaking_id  && sm.phase_id = um.phase_id && sm.task_id = um.task_id }
        end
    @planned_finishes = Milestone.find(:all, :include => [:rulemaking, :phase, :task, :date_category, :revision], :conditions => {:date_category_id => 2})
  end

  def search
    @search = Milestone.search(params[:search])
    @milestone_data = params[:search] ? @search.all(:include => [:rulemaking, :phase, :task, :date_category]) : [] #why don't I have to include :revision here?

  end
end
