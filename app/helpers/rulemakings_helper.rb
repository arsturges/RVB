module RulemakingsHelper

  def choosemilestone(phase, activity, date_category, revision = 3)
    milestone = @milestones.detect {|i| i.phase_id == phase and
                                            i.date_category_id == date_category and
                                            i.activity_id == activity and
                                            i.revision_number == revision #need to actually make this dynamic
                                       }
    if admin?
      text_field_tag("milestone_date_#{phase}_#{activity}_#{date_category}", milestone.try(:milestone), :class => 'milestone_date', :size => 10) +
     observe_field("milestone_date_#{phase}_#{activity}_#{date_category}" , :url => set_milestone_date_milestones_path(:activity => activity, :rulemaking => @rulemaking.id, :phase => phase, :date_category => date_category),
     :with => 'milestone_date')


    else
      milestone ? milestone.milestone : '--'
    end
  end
end
