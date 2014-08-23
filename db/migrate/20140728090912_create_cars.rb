class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.integer :user_id,		:null => false
      t.string :type, 			:null => false
      t.integer :seats,			:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end
