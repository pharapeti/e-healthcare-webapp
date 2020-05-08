$ ->
  console.log('we here')
  $('[data-channel-subscribe="chat-room"]').each (index, element) ->
    $element = $(element)
    room_id = $element.data('chat-room-id')
    messageTemplate = $('[data-role="chat-message-template"]')
    $element.animate { scrollTop: $element.prop('scrollHeight') }, 1000
    App.cable.subscriptions.create {
      channel: 'RoomChannel'
      room: room_id
    }, received: (data) ->
      content = messageTemplate.children().clone(true, true)
      content.find('[data-role="user-avatar"]').attr 'src', data.user_avatar_url
      content.find('[data-role="chat-message-text"]').text data.message
      content.find('[data-role="chat-message-date"]').text data.updated_at
      $element.append content
      $element.animate { scrollTop: $element.prop('scrollHeight') }, 1000
      return
    return
  return
