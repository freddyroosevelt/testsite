class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, deault: false
  end
end
