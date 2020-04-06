$(function(){
  $('.imageSmall').on('click',function(){
    let smallImgSrc = $(this).attr('src');
    $('.imageBig').attr('src',smallImgSrc);
  });
})