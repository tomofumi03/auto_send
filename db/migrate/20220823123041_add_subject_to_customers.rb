class AddSubjectToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :subject, :string
  end
end
