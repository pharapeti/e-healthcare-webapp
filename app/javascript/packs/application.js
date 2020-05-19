import 'bootstrap'
require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");

window.$ = window.jQuery = jQuery;
window.addEventListener('load', () => {
  jQuery('[data-toggle="tooltip"]').tooltip();
  jQuery('[data-toggle="popover"]').popover();
});
