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
			}
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
			}
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
				alert('6d couerse was activate successfully');
			},
			error: function(html){
				alert('6d couerse was activate');
			}
		});

   });

	$('#Pause_6D').click(function(){
            var stid = $('#p_m_id').attr('stid');
		$.ajax({
		type:"POST",
		url: "/teacher/dashboard/pause6dcourse/",
			data: "stid="+stid,
			success: function(html){
				alert('6d couerse was paused successfully');
			},
			error: function(html){
				alert('6d couerse was paused');
			}
		});

   });

 	$('#p_o_clear').click(function(){
            $('#p_object').val('');
            $('#p_m_id').val('');
        });

	$('#sendfeedback').click(function(){

            var stid = $(this).attr('stid');
		var level = $(":radio[name=level]:checked").val();
		var improvement = $(":radio[name=improvement]:checked").val();
		var difficulty = $("#difficult").val();
		var suggestions = $("#suggestion").val();
		var video = $("#videoDivInfo").attr('video');
		if (!level&&!improvement&&!suggestions&&!difficulty){
			alert('Suggestion was not sent! Please fill at least one field ');
			return;
		}
		$("#suggestion").val('');
		$("#difficult").val('');	
		$(":radio[name=improvement]").attr('checked','');
		$(":radio[name=level]").attr('checked','');
		$.ajax({
		type:"POST",
		url: "/student/profile/sendfeedback/",
			data: "stid="+stid+"&level="+level+"&improvement="+improvement+"&difficulty="+difficulty+"&suggestions="+suggestions,
			success: function(html){
				alert('המשוב שלך נשלח לצוות טיפולית אונליין. תודה');
			},
			error: function(html){
				alert('No video defined');
			}
		});
      });
});