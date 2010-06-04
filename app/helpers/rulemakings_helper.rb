module RulemakingsHelper
  def choosemilestone(phase, task, date_category)
          milestone = @rulemaking.find_milestone(phase, task, date_category, @revision_number)
    if admin?
      text_field_tag("milestone_date_#{phase}_#{task}_#{date_category}", milestone.try(:milestone), :class => 'milestone_date', :size => 10) +
     observe_field("milestone_date_#{phase}_#{task}_#{date_category}" , :url => set_milestone_date_milestones_path(:task => task, :rulemaking => @rulemaking.id, :phase => phase, :date_category => date_category),
     :with => 'milestone_date')
    else
      milestone ? milestone.milestone : '--'
    end
  end
end