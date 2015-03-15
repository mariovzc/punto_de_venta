class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :cedula, :null => false
      t.string :nombres , :null => false
      t.string :direccion
      t.string :telefono
      t.string :correo

      t.timestamps null: false
    end
  end
end
