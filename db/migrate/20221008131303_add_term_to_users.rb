class AddTermToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :term, :boolean, default: true
  end
end
