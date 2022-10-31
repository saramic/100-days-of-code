class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :address
      t.string :reference_id, null: false

      t.timestamps
    end
    add_index :companies, :reference_id, unique: true 
  end
end
