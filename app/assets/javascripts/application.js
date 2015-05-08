//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree ./app
//= require underscore
//= require gmaps/google
//= require slick.js.js
//= require pickadate/picker
//= require pickadate/picker.date
//= require pickadate/translations/fr_FR


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

$(document).ready(function() {
  $('.datepicker').pickadate({
    close: 'Fermer',
    hiddenSuffix: "",
    formatSubmit: "dd/mm/yyyy",
    format: 'dd/mm/yyyy',
  });

});