$(document).ready(function(){
	$( "#datepicker" ).datepicker({changeYear: true, changeMonth: true, yearRange: '1900:2010'});
	$( "#datepicker" ).datepicker( "option", "dateFormat", 'yy-mm-dd' );
	
	$('#showloginform').click(function(){
		
		show_login_form();
	});
});
function show_login_form(){
               var data = "";
               data = data + "<form method='post' action='/user/index/login/'>Login(email)<input type='text' name='email' value='' /><br/>Password<input type='password' name='password' /><br/><input type='submit' value='Login' /></form>"
              var $dialog = $('<div></div>')
                  .html(data)
                      .dialog({
                    	autoOpen: false,
	                  title: 'Login form',
      	            height: 160,
            	      width:200
	                });
              $dialog.dialog('open');
              return true;
	}

