class CreateSaleDetails < ActiveRecord::Migration
  def change
    create_table :sale_details do |t|
      t.references :sale, index: true
      t.references :product, index: true
      t.integer :cantidad, :null => false
      t.decimal :total, :null => false

      t.timestamps null: false
    end
    add_foreign_key :sale_details, :sales
    add_foreign_key :sale_details, :products
  end
end
