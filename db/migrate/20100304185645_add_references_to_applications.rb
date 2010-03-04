class AddReferencesToApplications < ActiveRecord::Migration
  def self.up
    add_column :applications, :references, :string
  end

  def self.down
    remove_column :applications, :references
  end
end
