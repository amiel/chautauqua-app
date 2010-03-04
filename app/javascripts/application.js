//= require <base>

$(document).ready(function() {
	$('#application_other').change(function() {
		var other = $('#application_other_abilities_input');
		if ($(this).is(':checked')) other.show();
		else other.hide();
	}).change();
	
	$('#application_transportation').change(function() {
		var other = $('#application_other_transportation_input');
		if (/other/i.test($(this).val())) other.show();
		else other.hide();
	}).change();

	$('#intro .show_hide').click(function() {
		var content = $("#more_info");
		
		if (content.data('hidden')) {
			content.data('hidden', false);
			content.data('show_text', $(this).text());
			content.slideDown('slow');
			$(this).text("Hide");
		} else {
			content.data('hidden', true);
			content.slideUp('slow');
			$(this).text(content.data('show_text'));
		}
	}).click();
	
});

