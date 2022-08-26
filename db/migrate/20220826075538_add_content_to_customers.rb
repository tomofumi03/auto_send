class AddContentToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :content, :text
  end
end
