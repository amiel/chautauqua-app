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
	});
});

