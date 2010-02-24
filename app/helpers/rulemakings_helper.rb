module RulemakingsHelper

  def choosemilestone(phase, activity, date_category)
    activity_date = @milestones.detect {|i| i.phase_id == phase and
                                            i.date_category_id == date_category and
                                            i.activity_id == activity
                                       }
    if admin?
      if activity_date
        link_to activity_date.milestone.to_date, edit_milestone_path(activity_date.id)
      else
        link_to "Add", new_milestone_path( :milestone => {:rulemaking_id=>params[:id], :phase_id=>phase, :activity_id=>activity, :date_category_id=>date_category} )
      end
    else
      activity_date ? activity_date.milestone.to_date : '--'
    end
  end
end
