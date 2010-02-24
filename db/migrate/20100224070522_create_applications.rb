class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :been_on_tour
      t.integer :how_many_tours
      t.text :chautauqua_contributions
      t.text :expchautauqua_eriences
      t.text :other_experiences
      t.string :amount_of_involvement
      t.string :possibility_of_involvement
      t.string :transportation
      t.integer :abilities_mask

      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
