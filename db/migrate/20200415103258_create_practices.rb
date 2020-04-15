class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string :name
      t.integer :phone
      t.string :address

      t.timestamps
    end
  end
end
