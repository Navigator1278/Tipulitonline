$(document).ready(function () {
    setInterval("UpdateActivity();", 5000);
    setInterval("CheckActivity();", 5000);
    $("#chatinput").focus();
    $("#chatsubmit").click(function(){
        PostMessage();
        });
    $(".changevisibility").click(function(){
       var visibility = $(this).attr('setvisibility');
       var personid = $('#chat').attr('personid');
       $('#chat').attr('isvisible',visibility);

        if (visibility==0){
            $('#invisiblestatus').html("<b style='color:red'>Invisible</b>");
        }
        else {
            $('#invisiblestatus').html("<b style='color:Green'>Visible</b>");
        }
        $.ajax({
	type:"POST",
	url: "/teacher/dashboard/changevisibility/",
	data: "visibility="+visibility+"&personid="+personid,
	success:function(data){
	},
	error: function(data){
	}
    });
    });


});


function handleKeyPress(e){
    if(window.event)
    {
    keynum = e.keyCode
    }
    else if(e.which)
    {
    keynum = e.which
    }
    if(keynum == 13) document.getElementById('chatsubmit').click();
    return false;
}

function PostMessage(){
        var message = $("#chatinput").val();
        var person = $('#chat').attr('person');
        var personid = $('#chat').attr('personid');
        var otherpersonid = $('#chat').attr('otherpersonid');
        if (message=='') return;
        $.ajax({
            type:"POST",
            url: "/user/index/addnewchatmessage/",
            dataType: 'json',
            data: "person="+person+"&personid="+personid+"&message="+message+"&otherpersonid="+otherpersonid,
            success:function(data){
            },
            error: function(data){
            }
        });
        $("#chatinput").val('');
        $("#chatinput").focus();
        CheckActivity();
        $(".mail-block").scrollTop($(".mail-block").get(0).scrollHeight);
}


function UpdateActivity() {
    var person = $('#chat').attr('person');
    var personid = $('#chat').attr('personid');
    var isvisible = $('#chat').attr('isvisible');
    if ((person=='teacher')&&(isvisible==0)) return;
    $.ajax({
	type:"POST",
	url: "/user/index/updateactivity/",
	dataType: 'json',
	data: "person="+person+"&personid="+personid,
	success:function(data){
	},
	error: function(data){
	}
    });
}

function CheckActivity() {
    var person = $('#chat').attr('person');
    var personid = $('#chat').attr('personid');
    var otherpersonid = $('#chat').attr('otherpersonid');
    $.ajax({
	type:"POST",
	url: "/user/index/checkactivity/",
	dataType: 'json',
	data: "person="+person+"&personid="+personid+"&otherpersonid="+otherpersonid,
	success:function(data){
            if (data!=""){
                        var newmessagesflag = 0;
                        var output = '';
                        var auth ="Auth";
                        $.each(data, function(i, val) {
                             if (val.chat_from_user_id) auth="<b style='color:red'>student</b>";
                             if (val.chat_from_teacher_id) auth="<b style='color:blue'>teacher</b>";
                             if (val.chat_isread_s==0) newmessagesflag=1;
                             output = output + "<br/>" + val.chat_message + " :[" + auth + "] " + val.chat_datetime ;
                         });
                         output = output + "<br/><br/><br/><br/>";
                   $("#chatbox").html(output);
                   if (newmessagesflag==1){
                        $("#chatrequest").html("<a href='/student/profile/chat/' target='new'><img alt='new chat-message' src='/i/chatmessage.gif'/><b>Alert: chat request</b></a>");
                   }
                   else {
                        $("#chatrequest").html("<a href='/student/profile/chat/' target='new'>Chat with teacher</a>");
                   }
                }
            else {
                        $("#chatrequest").html("<a href='/student/profile/chat/' target='new'>Chat with teacher</a>");
                
            }
	},
	error: function(data){
            
	}
    });
    $(".mail-block").scrollTop($(".mail-block").get(0).scrollHeight);
}
