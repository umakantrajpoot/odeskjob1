$(document).ready(function(){
  $('#listing_photos_attributes_0_image').on('change', function(e){
    var files = e.target.files;
    var filesStr = ""
    $.each(e.target.files, function(index){
      filesStr = filesStr + e.target.files[index].name + "<br/>"
    });
    $("#listing-selected-files").html(filesStr);
  });
});
