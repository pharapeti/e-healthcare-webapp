class CreateConsulationRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :consulation_requests do |t|
      t.references :patient, null: false, foreign_key: true
      t.text :description
      t.references :directed_to, null: false, foreign_key: true
      t.datetime :scheduled_for

      t.timestamps
    end
  end
end
