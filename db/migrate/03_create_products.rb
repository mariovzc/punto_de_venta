class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nombre, :null => false
      t.decimal :precio, :null => false

      t.timestamps null: false
    end
  end
end
