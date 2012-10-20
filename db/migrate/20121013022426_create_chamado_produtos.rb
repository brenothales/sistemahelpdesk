class CreateChamadoProdutos < ActiveRecord::Migration
  def change
    create_table :chamado_produtos do |t|
      t.references :chamado
      t.references :produto
      t.references :user
      t.text :observacao

      t.timestamps
    end
    add_index :chamado_produtos, :chamado_id
    add_index :chamado_produtos, :produto_id
    add_index :chamado_produtos, :user_id
  end
end
