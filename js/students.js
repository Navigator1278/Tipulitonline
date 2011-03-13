$(document).ready(function(){
		
	$('#uploadavatarform').hide(); 
	var isSet = 0;
	if ($('ul').hasClass('errors')) isSet=1;

	if (isSet) 
			$('#uploadavatarform').show(); 
	
	$('#uploadavatar').click(function(){
		$('#uploadavatarform').slideToggle();
	});
});
