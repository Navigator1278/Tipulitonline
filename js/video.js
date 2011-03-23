$(document).ready(function(){
	$('#p_m_id_send').click(function(){
	var code = $('#p_m_id').val();
	var teacher = $('#p_m_id').attr('teacherId');
	var stid = $('#p_m_id').attr('stid');
	$.ajax({
		type:"POST",
		url: "/teacher/dashboard/postkalturacode/",	
			data: "code="+code+"&teacher="+teacher+"&stid="+stid,
			success: function(html){
				alert('Video was sent to the student');
			},
			error: function(html){
				alert('Video was sent to the student');
			},
		});
	return false;
   });

	$('#p_object_send').click(function(){
	var code = $('#p_object').val();
	var teacher = $('#p_m_id').attr('teacherId');
	var stid = $('#p_m_id').attr('stid');
	$.ajax({
		type:"POST",
		url: "/teacher/dashboard/postkalturacode/",	
			data: "code2="+code+"&teacher="+teacher+"&stid="+stid,
			success: function(html){
				alert('Video was sent to the student');
			},
			error: function(html){
				alert('Video was sent to the student');
			},
		});
	return false;
   });

	$('#Activte_6D').click(function(){
		var stid = $('#p_m_id').attr('stid');
		$.ajax({
		type:"POST",
		url: "/teacher/dashboard/start6dcourse/",	
			data: "stid="+stid,
			success: function(html){
				alert('6d couerse was send successfuly');
			},
			error: function(html){
				alert('6d couerse was send');
			},
		});

   });

});