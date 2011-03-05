$(document).ready(function() {

	$('.content_row').each(function() {
		$(this).prepend("<span class=\"content_row_before\">&#160;<\/span>");
		$(this).prepend("<span class=\"content_row_after\">&#160;<\/span>");
	});

	$('.side_block').each(function() {
		$(this).prepend("<span class=\"side_block_before\">&#160;<\/span>");
		$(this).prepend("<span class=\"side_block_after\">&#160;<\/span>");
	});

	$('.form').each(function() {
		$(this).prepend("<span class=\"form_before\">&#160;<\/span>");
		$(this).prepend("<span class=\"form_after\">&#160;<\/span>");
		$(this).prepend("<span class=\"form_before_after\">&#160;<\/span>");
	});

});