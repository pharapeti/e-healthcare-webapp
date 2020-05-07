class AddStatusToRequests < ActiveRecord::Migration[6.0]
  def up
    add_column :urgent_requests, :status, :integer, null: false, default: 0
    add_column :consultation_requests, :status, :integer, null: false, default: 0
  end
end
