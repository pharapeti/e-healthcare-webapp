$ ->
  debugger
  $('#new_room_message').on 'ajax:success', (a, b, c) ->
    $(this).find('input[type="text"]').val ''
