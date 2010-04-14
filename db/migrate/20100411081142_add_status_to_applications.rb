class AddStatusToApplications < ActiveRecord::Migration
  def self.up
    add_column :applications, :status, :string
  end

  def self.down
    remove_column :applications, :status
  end
end
