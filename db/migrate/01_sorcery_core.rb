class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombres, :null => false
      t.string :direccion
      t.string :telefono
      t.boolean :sexo
      t.boolean :activo
      t.text :observacion
      t.string :foto      
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end