class AddReplyToApplications < ActiveRecord::Migration
  def self.up
    add_column :applications, :reply, :string
  end

  def self.down
    remove_column :applications, :reply
  end
end
