class CreateLicenseActivations < ActiveRecord::Migration[6.0]
  def change
    create_table :license_activations do |t|
      t.text :license_number, null: false, index: { unique: true }
      t.text :code, null: false
      t.boolean :redeemed, default: false, null: false
      t.datetime :redeemed_at

      t.timestamps
    end
  end
end
