setInterval(function() { 
  $('#news_slideshow > div:first')
    .fadeOut(2000)
    .next()
    .fadeIn(2000)
    .end()
    .appendTo('#news_slideshow');
},  4000);
