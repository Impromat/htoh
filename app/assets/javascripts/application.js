//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree ./app
//= require bootstrap-datepicker
//= require underscore
//= require gmaps/google
//= require slick.js.js


$(document).ready(function() {
  $('.carousel').slick({
      slidesToShow: 4,
      slidesToScroll: 4,
      arrows: false

    });

  $('.left').click(function(){
      $('.carousel').slick("slickPrev");
    })

  $('.right').click(function(){
      $('.carousel').slick("slickNext");
    })

  // $('#map').affix({
  //   offset: {
  //     top: 100,
  //     bottom: function () {
  //       return (this.bottom = $('#research-end').outerHeight(true))
  //     }
  //   }
  // })
})