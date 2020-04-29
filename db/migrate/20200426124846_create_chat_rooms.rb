class CreateChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_rooms do |t|
      t.references :urgent_request, index: true, foreign_key: false
      t.references :consulation_request, index: true, foreign_key: false
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :chat_rooms, :urgent_requests, column: :urgent_request_id
    add_foreign_key :chat_rooms, :consulation_requests, column: :consulation_request_id
  end
end
