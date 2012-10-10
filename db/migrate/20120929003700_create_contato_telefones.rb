class CreateContatoTelefones < ActiveRecord::Migration
  def change
    create_table :contato_telefones do |t|
      t.string :DDD
      t.string :numero
      t.string :ramal
      t.boolean :fax
      t.references :cliente

      t.timestamps
    end
    add_index :contato_telefones, :cliente_id
  end
end
