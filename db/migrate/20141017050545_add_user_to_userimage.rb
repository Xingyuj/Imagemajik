class AddUserToUserimage < ActiveRecord::Migration
  def change
    add_reference :userimages, :user, index: true
  end
end
