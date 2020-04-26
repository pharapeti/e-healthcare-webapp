class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :created_by, null: false, foreign_key: true
      t.references :directed_to, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
