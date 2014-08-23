class AddStatusToBooking < ActiveRecord::Migration
  def self.up
    add_column :bookings, :status, :boolean
  end

  def self.down
    remove_column :bookings, :status
  end
end
