# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def schedule_lag(projected_task_finish, planned_task_finish, rulemaking_finish)
    if rulemaking_finish != projected_task_finish #can't divide by 0
      ratio = (projected_task_finish - planned_task_finish) / (rulemaking_finish - projected_task_finish)
      number_to_percentage(100 * ratio, :precision => 0)
    else
      puts "--"
    end
  end
end
