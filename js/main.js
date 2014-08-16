$(function(){
  console.log("Run it");
  $('#myCarousel').carousel({});

  $('#myCarousel').swiperight(function() {
    $(this).carousel('prev');
  });
  $('#myCarousel').swipeleft(function() {
    $(this).carousel('next');
  })

});
