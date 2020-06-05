$("#clothing_news_slideshow > div").hide();

setInterval(function() { 
  $('#clothing_news_slideshow > div:first')
    .fadeOut(2000)
    .next()
    .fadeIn(2000)
    .end()
    .appendTo('#clothing_news_slideshow');
},  4000);
