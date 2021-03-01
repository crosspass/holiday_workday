//= require jquery
//= require jquery_ujs
//= require_self

$(document).on('ajax:send', 'a[data-remote]', () => {
  $('.spinner-wrapper').removeClass('hide');
})

$(document).on('ajax:complete', 'a[data-remote]', () => {
  $('.spinner-wrapper').addClass('hide');
})