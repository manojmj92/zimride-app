
jQuery(document).ready(function() {

  

  jQuery('input.datepicker').Zebra_DatePicker({
    direction: true,
  });
  

  jQuery('#book').click(function() {
      jQuery('.dropdown-menu search').trigger('click')
  });

  
  function check(condition)
  {
  		if (condition)
  	{
  		return true;

  	}
  		console.log("here")
 		jQuery("#flash_messages").empty();
  		jQuery("#flash_messages").append('<div class="alert"><p id="alert_msg"></p><button type="button" class="close" data-dismiss="alert">&times</button></div>');
  		jQuery("#alert_msg").text('Please enter correct details');
  		jQuery("#flash_messages").show().delay(3000).fadeOut();
  		return false;

  }
  jQuery('#ride_create_button').click(function(){

  		return check(jQuery('#searchTextField').val() &&  jQuery('#searchTextField2').val() &&  jQuery("#mydate").val() && /^[0-9]+$/.test(jQuery("#cost").val()) && jQuery("#cost").val() > 0);
  	
  });

  jQuery('#ride_edit_button').click(function(){


  		return check(jQuery('#searchTextField').val() &&  jQuery('#searchTextField2').val() &&  jQuery("#mydate").val() && /^[0-9]+$/.test(jQuery("#cost").val()) && jQuery("#cost").val() > 0);
  		

  });

  jQuery('#car_create_button').click(function(){

  	return check(jQuery('#typeofcar').val() && /^[0-9]+$/.test(jQuery("#seats").val()) && jQuery("#seats").val() > 0)

  });

  jQuery('#car_edit_button').click(function(){

  	return check(jQuery('#typeofcar').val() && /^[0-9]+$/.test(jQuery("#seats").val()) && jQuery("#seats").val() > 0)

  });

  jQuery('#user_edit_button').click(function(){

  	return check(jQuery('#name').val() && /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/.test(jQuery("#email").val()) && jQuery("#description").val() && jQuery("#password").val().length >= 6 && (jQuery("#password").val() == jQuery("#confirm_password").val()))

  });

  jQuery('#search_button').click(function(){

  	return check(jQuery("#searchTextField4").val() && jQuery("#date").val()) 

  });
});