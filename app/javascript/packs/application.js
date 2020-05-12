require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");

import "../../assets/stylesheets/application";
import '../../javascript/channels/chat_room_channel'

global.$ = require('jquery');
window.$ = window.jQuery = jQuery;
window.addEventListener('load', () => {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
});
