$(document).ready(function(){

        $("input[readonly='readonly']").css('color', 'green');
        $("select[disabled='true']").css('color', 'green');
	$('#uploadavatarform').hide(); 
	var isSet = 0;
	if ($('ul').hasClass('errors')) isSet=1;

	if (isSet) 
			$('#uploadavatarform').show(); 
	
	$('#uploadavatar').click(function(){
		$('#uploadavatarform').slideToggle();
	});

        $('#c_u_submit').click(function(){
            var statustext = $("#c_u_status option:selected").text();
            var statusid = $("#c_u_status option:selected").val();
            var stid = $('#p_m_id').attr('stid');
            $("#currentstatus").text(statustext);
            $.ajax({
		type:"POST",
		url: "/teacher/dashboard/changestatus/",
		data: "statusid="+statusid+"&stid="+stid,
			success: function(html){
			},
			error: function(html){
			}
		});
	return false;
        });

 });
