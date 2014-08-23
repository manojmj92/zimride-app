class AddCostToRides < ActiveRecord::Migration
  def self.up
    add_column :rides, :cost, :integer
  end

  def self.down
    remove_column :rides, :cost
  end
end
