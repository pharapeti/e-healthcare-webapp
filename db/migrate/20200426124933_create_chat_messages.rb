class CreateChatMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_messages do |t|
      t.references :chat_room, null: false, foreign_key: true
      t.references :sent_by, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
