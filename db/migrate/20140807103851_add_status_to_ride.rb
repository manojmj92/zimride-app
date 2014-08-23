class AddStatusToRide < ActiveRecord::Migration
  def self.up
    add_column :rides, :status, :boolean
  end

  def self.down
    remove_column :rides, :status
  end
end
