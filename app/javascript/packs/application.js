import 'bootstrap'
require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");
require('datatables.net-bs4');

window.$ = window.jQuery = jQuery;
window.addEventListener('load', () => {
  jQuery('[data-toggle="tooltip"]').tooltip();
  jQuery('[data-toggle="popover"]').popover();
});
