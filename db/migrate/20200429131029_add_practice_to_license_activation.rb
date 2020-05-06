class AddPracticeToLicenseActivation < ActiveRecord::Migration[6.0]
  def change
    add_column :license_activations, :practice_id, :integer
  end
end
