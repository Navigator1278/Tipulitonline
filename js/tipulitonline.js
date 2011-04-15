$(document).ready(function(){

        $("#state option[value='81']").attr("selected","selected");
	$( "#datepicker" ).datepicker({changeYear: true, changeMonth: true, yearRange: '1900:2010'});
	$( "#datepicker" ).datepicker( "option", "dateFormat", 'yy-mm-dd' );
	
	$('#showloginform').click(function(){
		show_login_form();
	});

	$('#uploadavatarform').hide();
	$('#uploadavatar').click(function(){
		$('#uploadavatarform').slideToggle();
	});
});
function show_login_form(){
               var data = "";
              data = data + "<form method='post' action='/user/index/login/'>אימייל<input type='text' name='email' value='' /><br/>סיסמא<input type='password' name='password' /><br/><input type='submit' name='login' value='להיכנס' /><br/></form>"
              var $dialog = $("<div></div>")
                  .html(data)
                      .dialog({
                    	autoOpen: false,
	                  title: 'כניסה למרכז הלמידה',
      	            height: 180,
            	      width:220
	                });
              $dialog.dialog('open');
              return true;
	}

