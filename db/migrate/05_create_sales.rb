class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :fecha
      t.decimal :subtotal
      t.decimal :total
      t.references :client, :null => false, index: true
      t.references :user, :null => false, index: true
      t.boolean :estado

      t.timestamps null: false
    end
    add_foreign_key :sales, :clients
    add_foreign_key :sales, :users
  end
end
