class ChangeReplyToText < ActiveRecord::Migration
  def self.up
    change_column :applications, :reply, :text
  end

  def self.down
    change_column :applications, :reply, :string
  end
end
