class RemoveEmailAndPasswordFromHosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :hosts, :email
    remove_column :hosts, :password
  end
end
