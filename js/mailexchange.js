$(document).ready(function(){
$('.eachmessage').next().hide();
$('.eachmessage').click(function(){
	$(this).next().slideToggle('fast');
	$('#mailsubj').val('');
});

$('.replylink').click(function(){
	$('#newmailform').show();
	var subj = $(this).attr('subj');
	subj = "Re: " + subj;
	$('#mailsubj').val(subj);
});

});
