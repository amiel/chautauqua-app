class AddAddressAndVideoUrlToApplications < ActiveRecord::Migration
  def self.up
    add_column :applications, :address, :text
    add_column :applications, :video_url, :string
  end

  def self.down
    remove_column :applications, :video_url
    remove_column :applications, :address
  end
end
