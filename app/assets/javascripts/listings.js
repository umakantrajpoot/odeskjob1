$(document).ready(function(){
  $('#listing_photos_attributes_0_image').on('change', function(e){
    var files = e.target.files;
    var filesStr = ""
    $.each(e.target.files, function(index){
      filesStr = filesStr + e.target.files[index].name + "<br/>"
    });
    $("#listing-selected-files").html(filesStr);
  });

  $('#listing_business_number').on('keyup', function(event){
    var businessNumber = $(event.target).val();
    if(businessNumber != null && businessNumber  != ""){
      $(".input-icon-spinner").removeClass('uk-hidden');
      $(".input-icon-check").addClass('uk-hidden');
      $.ajax({
        type: "get",
        url: "/listings/get_business_number",
        dataType: "script",
        data: {business_number: businessNumber}
      });
    } else {
      $(".input-icon-spinner").removeClass('uk-hidden');
      $(".input-icon-check").addClass('uk-hidden');
      $("#listing_submit").prop('disabled', 'disabled')
      $("#bussiness_number_alert_msg").removeClass('uk-hidden');
    }
  });

  $('#listing_business_number').on('focusout', function(event){
    var businessNumber = $(event.target).val();
    if(businessNumber != null && businessNumber  != ""){
      $(".input-icon-spinner").removeClass('uk-hidden');
      $(".input-icon-check").addClass('uk-hidden');
      $("#listing_submit").prop('disabled', 'disabled')
      $("#bussiness_number_alert_msg").removeClass('uk-hidden');
    }
  });

  $("#listing_submit").on('click', function(event){
    $(event.target).prop('disabled', 'disabled')
    $(".listing-submit-msg").removeClass('uk-hidden');
  });

});

