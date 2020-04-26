class CreateUrgentRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :urgent_requests do |t|
      t.references :patient, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
