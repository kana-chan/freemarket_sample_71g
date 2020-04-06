$(function(){
  $('#user_image').on('change',function(){
    var file = $(this).prop('files')[0];
    var reader = new FileReader();

    reader.onloadend =function(){
      var src = reader.result
      $('.image').prop('src',src);
    }
    reader.readAsDataURL(file);
  });
})