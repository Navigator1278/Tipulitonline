$(document).ready(function () {

    setInterval("UpdateActivity();", 60000);
    setInterval("CheckActivity();", 5000);
    $("#chatinput").focus();
    $("#chatsubmit").click(function(){
        PostMessage();
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
                $("#chatrequest").html("<b>NEW CHAT REQUEST</b>");
                        var output = '';
                        var auth ="Auth";
                        $.each(data, function(i, val) {
                             if (val.chat_from_user_id) auth="<b style='color:red'>student</b>";
                             if (val.chat_from_teacher_id) auth="<b style='color:blue'>teacher</b>";
                             output = output + "<br/>" + val.chat_message + " :[" + auth + "] " + val.chat_datetime ;
                         });
                         output = output + "<br/><br/><br/><br/>";
                   $("#chatbox").html(output);
                }
            else {
                
            }
	},
	error: function(data){
            
	}
    });
    $(".mail-block").scrollTop($(".mail-block").get(0).scrollHeight);
}
