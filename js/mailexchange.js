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

$('.eachmessage').click(function(){
	var mailid  = $(this).attr('id');
        var side = $(this).attr('side');
        var numberofunreadmails = $("#numberofunreadmails").attr('q');
        var currentclass = $(this).children(':first').hasClass('unread');
        if (currentclass){
            numberofunreadmails=numberofunreadmails-1;
        }
        $("#numberofunreadmails").attr('q',numberofunreadmails);
        $("#numberofunreadmails").text(numberofunreadmails);
        $(this).children().removeClass('unread');
	$.ajax({
		type:"POST",
		url: "/student/profile/setreadflag/",
			data: "mailid="+mailid+"&side="+side,
			success: function(html){
			},
			error: function(html){
			}
		});
});

$('#course6d').click(function(){

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
			}
		});
	}
});


});
