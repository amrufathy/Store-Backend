class RemoveUsernameAndProviderFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :username
    remove_column :customers, :provider
  end
end
