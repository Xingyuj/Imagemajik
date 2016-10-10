class AddIsDeleteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_delete, :integer
    add_column :userimages, :is_delete, :integer
  end
end
