class CreateSharelists < ActiveRecord::Migration
  def change
    create_table :sharelists do |t|
      t.string :email
      t.integer :imageid
      t.timestamps
    end
  end
end
