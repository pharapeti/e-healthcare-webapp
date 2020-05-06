class CreateTranscripts < ActiveRecord::Migration[6.0]
  def change
    create_table :transcripts do |t|
      t.references :chat_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
