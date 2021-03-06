class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :answered_by, null: false, foreign_key: false
      t.text :description

      t.timestamps
    end
    add_foreign_key :answers, :doctors, column: :answered_by_id
  end
end
