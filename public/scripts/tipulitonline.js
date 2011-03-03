$(document).ready(function(){
	$( "#datepicker" ).datepicker({changeYear: true, changeMonth: true, yearRange: '1930:2000'});
	$( "#datepicker" ).datepicker( "option", "dateFormat", 'yy-mm-dd' );
});