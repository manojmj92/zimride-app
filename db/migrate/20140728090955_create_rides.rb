class CreateRides < ActiveRecord::Migration
  def self.up
    create_table :rides do |t|
      t.integer :user_id, 		:null => false
      t.integer :car_id,			:null => false
      t.string 	:from, 			:null => false
      t.string  :to, 			:null => false
      t.date 	:date,			:null => false
      t.seats  	:seats,			:null => false
      t.charge  :charge,		:null => false


      t.timestamps
    end
  end

  def self.down
    drop_table :rides
  end
end
