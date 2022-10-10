class RemoveTermFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :term, :boolean
  end
end
