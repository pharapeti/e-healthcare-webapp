import consumer from "./consumer"

window.addEventListener('load', () =>{
  const chat_room_element = document.getElementById('chat-room-id');
  const chat_room_id = Number(chat_room_element.getAttribute('data-chat-room-id'));

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription);
  });

  consumer.subscriptions.create({ channel: "ChatRoomChannel", chat_room_id: chat_room_id }, {
    connected() {
      console.log("Connected to the chat room");
    },

    disconnected(){
    },

    received(data){
      if(data.action === 'end_session') {
        window.location = '/';
      } else {
        const user_element = document.getElementById('user-id');
        const user_id = Number(user_element.getAttribute('data-user-id'));
        let html;

        if (user_id === data.chat_message.user_id) {
          html = data.mine;
        } else {
          html = data.theirs;
        }

        const chatMessageContainer = document.getElementById("chat_messages");
        chatMessageContainer.innerHTML = chatMessageContainer.innerHTML + html;
        chatMessageContainer.scrollTop = chatMessageContainer.scrollHeight - chatMessageContainer.clientHeight;
      }
    }
  });
});
