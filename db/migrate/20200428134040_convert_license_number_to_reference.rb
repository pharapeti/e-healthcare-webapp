class ConvertLicenseNumberToReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :doctors, :license_number
    add_reference :doctors, :license_activation, index: true
  end
end
