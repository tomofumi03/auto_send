class AddTermToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :term, :boolean, default: true
  end
end
