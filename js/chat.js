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

<<<<<<< HEAD
    $(".smilebuttons").click(function(){
        var smilecode = $(this).attr('smilecode');
        var currentval = nicEditors.findEditor('chatinput').getContent();
        nicEditors.findEditor('chatinput').setContent(currentval + smilecode);
        
    });
=======
>>>>>>> 67f0acfa69eefcffd7e3b2899a0c71c9c886d7d3

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
        var message = nicEditors.findEditor('chatinput').getContent();
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
        nicEditors.findEditor('chatinput').setContent("");
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
<<<<<<< HEAD
                        var output = "<table id='chattable'>";
=======
                        var output = '';
>>>>>>> 67f0acfa69eefcffd7e3b2899a0c71c9c886d7d3
                        var auth ="Auth";
                        $.each(data, function(i, val) {
                             if (val.chat_from_user_id) auth="<b style='color:red'>student</b>";
                             if (val.chat_from_teacher_id) auth="<b style='color:blue'>teacher</b>";
                             if (val.chat_isread_s==0) newmessagesflag=1;
<<<<<<< HEAD
                             output = output + "<tr><td> [" + auth + "]: "+ "</td><td>" + val.chat_message;
                             if (val.chat_message=='New chat request'){
                                output = output + " at " + val.chat_datetime + "<td></tr>";
                             }
                             else {
                                output = output + "</td></tr>";
                             }
                        });
                         output = output + "</table><br/><br/><br/><br/>";
=======
                             output = output + "<br/>" + val.chat_message + " :[" + auth + "] " + val.chat_datetime ;
                         });
                         output = output + "<br/><br/><br/><br/>";
>>>>>>> 67f0acfa69eefcffd7e3b2899a0c71c9c886d7d3
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

function getCaretPos(obj)
{
  obj.focus();
 
  if(obj.selectionStart) return obj.selectionStart;//Gecko
  else if (document.selection)//IE
  {
    var sel = document.selection.createRange();
    var clone = sel.duplicate();
    sel.collapse(true);
    clone.moveToElementText(obj);
    clone.setEndPoint('EndToEnd', sel);
    return clone.text.length;
  }

  return 0;
}
