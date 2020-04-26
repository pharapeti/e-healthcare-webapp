class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :answered_by, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
