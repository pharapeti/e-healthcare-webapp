class CreateChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_rooms do |t|
      t.references :urgent_request, index: true, foreign_key: false
      t.references :consultation_request, index: true, foreign_key: false
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :chat_rooms, :urgent_requests, column: :urgent_request_id
    add_foreign_key :chat_rooms, :consultation_requests, column: :consultation_request_id
  end
end
