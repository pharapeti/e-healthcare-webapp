require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");

import "bootstrap";
import "../../assets/stylesheets/application";

global.$ = require('jquery')
window.$ = window.jQuery = jQuery;
window.addEventListener('load', () => {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
});
