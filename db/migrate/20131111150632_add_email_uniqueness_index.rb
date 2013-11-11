class AddEmailUniquenessIndex < ActiveRecord::Migration
  def change
    add_index :users, :email, :unique => true
    
    remove_index :users, :email
  end
end
