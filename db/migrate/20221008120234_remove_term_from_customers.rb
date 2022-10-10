class RemoveTermFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :term, :boolean
  end
end
