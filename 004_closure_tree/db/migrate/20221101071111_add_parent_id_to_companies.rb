class AddParentIdToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :parent_id, :integer
  end
end
