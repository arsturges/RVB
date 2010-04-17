# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def schedule_lag(projected_activity_finish, planned_activity_finish, rulemaking_finish)
    if rulemaking_finish.to_time != projected_activity_finish.to_time
      ratio = (projected_activity_finish.to_time - planned_activity_finish.to_time) / (rulemaking_finish.to_time - projected_activity_finish.to_time)
      number_to_percentage(100 * ratio, :precision => 0)
    else
      puts "--"
    end
  end
end
