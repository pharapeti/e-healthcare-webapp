class CreateConsulationRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :consulation_requests do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :directed_to, null: false, foreign_key: false
      t.text :description
      t.datetime :scheduled_for

      t.timestamps
    end
    add_foreign_key :consulation_requests, :doctors, column: :directed_to_id
  end
end
