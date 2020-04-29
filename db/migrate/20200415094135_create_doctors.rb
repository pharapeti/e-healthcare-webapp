class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.references :user, null: true, foreign_key: true
      t.integer :license_number
      t.references :practice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
