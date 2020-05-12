import consumer from "./consumer"

console.log("HELLO THERE");

consumer.subscriptions.create({ channel: "ChatRoomChannel", chat_room_id: 1 }, {
  connected() {
    console.log("connected...");
  },

  disconnected(){

  },

  received(data){
    //console.log(data);
  }
});
//
// document.addEventListener('load', () => {
//   const element = document.getElementById('chat-room-id');
//
//   if(element){
//     const chat_room_id = element.getAttribute('data-chat-room-id');
//
//     consumer.subscriptions.create({ channel: "ChatRoomChannel", chat_room_id: chat_room_id }, {
//       connected() {
//         console.log("Connected to chat room channel " + chat_room_id);
//       },
//
//       disconnected(){
//
//       },
//
//       received(data){
//         console.log(data);
//       }
//     });
//   }
// })