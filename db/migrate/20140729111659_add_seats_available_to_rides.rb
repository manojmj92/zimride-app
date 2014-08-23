class AddSeatsAvailableToRides < ActiveRecord::Migration
  def self.up
    add_column :rides, :seats_available, :integer
  end

  def self.down
    remove_column :rides, :seats_available
  end
end
