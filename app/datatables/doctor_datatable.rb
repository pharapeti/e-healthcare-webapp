class DoctorDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      license_number: { source: "LicenseActivation.license_number" },
      name: { source: "User.username" },
      practice: { source: "Practice.name" },
      address: { source: "Practice.address" },
      phone: { source: "Practice.phone" }
    }
  end

  def data
    records.map do |record|
      {
        license_number: record.license_activation.license_number,
        name: record.name,
        practice: record.practice.name,
        address: record.practice.address,
        phone: record.practice.phone
      }
    end
  end

  def get_raw_records
    Doctor
    .includes(:practice, :user, :license_activation)
    .references(:practice, :user, :license_action)
  end
end
