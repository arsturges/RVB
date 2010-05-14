// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
										
$('#search_milestone_gt').datepicker();
$('#search_milestone_lt').datepicker();
$('.milestone_date').datepicker({dateFormat: 'yy-mm-dd'});
$("input#rulemaking_id").autocomplete("auto_complete_for_rulemaking_id")
});
