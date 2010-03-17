module RulemakingsHelper

  def choosemilestone(phase, activity, date_category)
    milestone = @milestones.detect {|i| i.phase_id == phase and
                                            i.date_category_id == date_category and
                                            i.activity_id == activity
                                       }
    if admin?
#      if activity_date
#        link_to activity_date.milestone, edit_milestone_path(activity_date.id), :class => 'milestone_date'
#      else
#        link_to "Add", new_milestone_path( :milestone => {:rulemaking_id=>params[:id], :phase_id=>phase, :activity_id=>activity, :date_category_id=>date_category} ), :class => 'milestone_date'
#      end
      text_field_tag("milestone_date_#{phase}_#{activity}_#{date_category}", milestone.try(:milestone), :class => 'milestone_date', :size => 10) +
     observe_field("milestone_date_#{phase}_#{activity}_#{date_category}" , :url => set_milestone_date_milestones_path(:activity => activity, :rulemaking => @rulemaking.id, :phase => phase, :date_category => date_category),
     :with => 'milestone_date')


    else
      milestone ? milestone.milestone : '--'
    end
  end
end
