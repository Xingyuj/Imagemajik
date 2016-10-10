class CreateUserimages < ActiveRecord::Migration
  def change
    create_table :userimages do |t|
      t.string :title
      t.string :imageversion
      t.text :description
      t.string :image
      t.timestamps
    end
  end
end
