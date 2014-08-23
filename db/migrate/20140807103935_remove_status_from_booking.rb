class RemoveStatusFromBooking < ActiveRecord::Migration
  def self.up
    remove_column :bookings, :status
  end

  def self.down
    add_column :bookings, :status, :boolean
  end
end
