module RulemakingsHelper

  def selectmilestone(phase, activity, date_category)
    milestone = @milestones.detect {|i| i.phase_id == phase and
                                            i.date_category_id == date_category and
                                            i.activity_id == activity
                                       }
  end

  def choosemilestone(phase, activity, date_category)
        milestone = @milestones.detect {|i| i.phase_id == phase and
                                            i.date_category_id == date_category and
                                            i.activity_id == activity
                                       }
    if admin?
      text_field_tag("milestone_date_#{phase}_#{activity}_#{date_category}", milestone.try(:milestone), :class => 'milestone_date', :size => 10) +
     observe_field("milestone_date_#{phase}_#{activity}_#{date_category}" , :url => set_milestone_date_milestones_path(:activity => activity, :rulemaking => @rulemaking.id, :phase => phase, :date_category => date_category),
     :with => 'milestone_date')


    else
      milestone ? milestone.milestone : '--'
    end
  end

  def list_rulemaking_attributes(instance_variable, attribute)
       instance_variable.each do |n|
       n.attribute + ", "
    end
  end

#  def scheduled_phase(e15, e24, e33, e43, f20, f29, f39, f49, h15, h24, h33, h43, i29, i39, i49)
#    if Date.today > (e15 ? e15 : h15) and Date.today <= (
#        if f20
#          f20
#          elsif e24
#          e24
#        else
#          h24
#        end
#        )
#        phase = "Framework"
#      end
#  end
end
