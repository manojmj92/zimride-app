class AddTypeofcarToCars < ActiveRecord::Migration
  def self.up
    add_column :cars, :typeofcar, :string
  end

  def self.down
    remove_column :cars, :typeofcar
  end
end
