/*=============================================================
    Authour URL: www.designbootstrap.com
    
    http://www.designbootstrap.com/

    License: MIT

    http://opensource.org/licenses/MIT

    100% Free To use For Personal And Commercial Use.

    IN EXCHANGE JUST TELL PEOPLE ABOUT THIS WEBSITE
   
    ========================================================  */
    $(document).ready(function () {

    /*====================================
          SUBSCRIPTION   SCRIPTS 
          ======================================*/


          $("#postcontent").submit(function (e) {
            e.preventDefault();
            $.ajax({
              type: "POST",
              url: "subscribe.php",
              data: $("#postcontent").serialize(),
              success: function (response) {
               $('[name="name"]').val('');
               $('[name="telephone"]').val('');
               $('[name="email"]').val('');
               $('[name="message"]').val('');
               // alert(response); // FOR ACTUAL RESPONSE
			   // alert('Entraremos em contato o mais breve possível. Obrigado!');
        jAlert('Mensagem enviada com sucesso!', '');
      }
    });
            e.preventDefault();
          });

    // SCROLL SCRIPTS 
    $('.scroll-me a').bind('click', function (event) { //just pass scroll-me class and start scrolling
      var $anchor = $(this);
      $('html, body').stop().animate({
        scrollTop: $($anchor.attr('href')).offset().top
      }, 1000, 'easeInOutQuad');
      event.preventDefault();
    });

  });
