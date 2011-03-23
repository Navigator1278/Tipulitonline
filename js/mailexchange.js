$(document).ready(function(){
$('.eachmessage').next().hide();
$('#newmailform').slideToggle('fast');


$('.eachmessage').click(function(){
	$('td').removeClass('currentmessage');
	$(this).addClass('currentmessage');
	$(this).next().slideToggle('fast');
});

$('#newmaillink').click(function(){
	$('#newmailform').slideToggle();
	$('#newmaillink').hide();
});

$('.replylink').click(function(){
	$('#newmailform').show();
	$('#newmaillink').hide();
	var subj = $(this).attr('subj');
	subj = "Re: " + subj;
	$('#mailsubj').val(subj);
});

$('.eachmessage').mouseover(function(){
	$(this).addClass('currentmessage');
});

$('.eachmessage').mouseout(function(){
	$(this).removeClass('currentmessage');
});

$('#sub-bottom-border').click(function(){

	if (confirm('A you sure to subscribe for the 6D course?')) {
	var stid = $(this).attr('stid');
	$.ajax({
		type:"POST",
		url: "/student/profile/subscribecourse/",	
			data: "stid="+stid,
			success: function(html){
				alert('You were subscribed for the 6D course successfuly');
			},
			error: function(html){
				alert('You were subscribed for the 6D course');
			},
		});
	}
});


});
