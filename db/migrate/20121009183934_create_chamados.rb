class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
      t.string :assunto
      t.text :descricao
      t.string :prioridade
      t.string :tipoAtendimento
      t.boolean :cortesia
      t.text :observacao
      t.boolean :solucionado
      t.boolean :finalizaSolicitacao
      t.decimal :valorGeral
      t.references :usuario
      t.references :produto

      t.timestamps
    end
    add_index :chamados, :usuario_id
    add_index :chamados, :produto_id
  end
end
