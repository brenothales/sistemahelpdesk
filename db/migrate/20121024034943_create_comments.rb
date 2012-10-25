class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :chamado
      t.text :descricao
      t.boolean :finalizarChamado, :default => false

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :chamado_id
  end
end
