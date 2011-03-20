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
				$('#p_m_id').val(html);
				alert('OK');
			},
			error: function(html){
				$('#p_m_id').val(html);
				alert('fail');
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
				$('#p_m_id').val(html);
				alert('OK');
			},
			error: function(html){
				$('#p_m_id').val(html);
				alert('fail');
			},
		});
	return false;
   });

	$('#kaltura_player').click(function(){
		alert('Ifrmae');
	});


});

