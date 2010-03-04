class ChangeEmailToLoginForAdmins < ActiveRecord::Migration
  def self.up
    rename_column :admins, :email, :login
  end

  def self.down
    rename_column :admins, :login, :email
  end
end
