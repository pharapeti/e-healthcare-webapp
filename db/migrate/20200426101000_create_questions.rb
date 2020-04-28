class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :created_by, null: false, foreign_key: false
      t.references :directed_to, null: false, foreign_key: false
      t.text :description

      t.timestamps
    end
    add_foreign_key :questions, :patients, column: :created_by_id
    add_foreign_key :questions, :doctors, column: :directed_to_id
  end
end
