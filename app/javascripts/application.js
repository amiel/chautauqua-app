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
	
	$('[name=application\\[been_on_tour\\]]').change(function(){
		var v = $(this).val(), how_many_tours = $('#application_how_many_tours'), how_many_tours_container = $('#application_how_many_tours_input');
		if (v == 'false') {
			how_many_tours.val('0');
			how_many_tours_container.hide();
		} else {
			how_many_tours_container.show();
		}
	});
	
	
	// admin
	$('.actions [data-update-path]').click(function() {
		var t = $(this), vars = { '_method': 'put', 'application': { 'status': t.attr('data-status') } };
		t.parent().find('a').removeClass('active')
		$.post(t.attr('data-update-path'), vars, function() {
			t.addClass('active');
		});
	});
});

