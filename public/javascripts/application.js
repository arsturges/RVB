// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
$('#extra_addresses li a[data-method="delete"]').live('ajax:before', 
										function() {
											$(this).parent().fadeOut();
											$('#spinner').show();
										}
									);

$('#extra_addresses li a[data-method="delete"]').live('ajax:complete', 
										function() {
											$('#spinner').hide();
										}
									);


$('#new_member').live('ajax:before', function() {
	$('#spinner').show();
});
										
$('.listing > td.attribute').live('click', function() {
	document.location = $(this).parent().attr('data-href');
})

$('#search_milestone_gt').datepicker();
$('#search_milestone_lt').datepicker();
$('.milestone_date').datepicker({dateFormat: 'yy-mm-dd'});

});
