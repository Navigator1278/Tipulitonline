$(document).ready(function(){
	$( "#datepicker" ).datepicker({changeYear: true, changeMonth: true, yearRange: '1900:2010'});
	$( "#datepicker" ).datepicker( "option", "dateFormat", 'yy-mm-dd' );
});