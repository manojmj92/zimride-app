class RemoveTypeFromCars < ActiveRecord::Migration
  def self.up
    remove_column :cars, :type
  end

  def self.down
    add_column :cars, :type, :string
  end
end
