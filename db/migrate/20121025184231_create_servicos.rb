class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.string  :nome,     :limit => 30
      t.integer :numero_os, :limit => 11
      t.date    :published_on
      t.boolean :completado, default: false, null: false
      t.boolean :retirado,   default: false, null: false
      t.decimal :valor_Servico, :precision => 10, :scale => 2
      t.text    :observacao
      t.text    :laudo
      t.text    :descricao
      t.text    :solucao
      t.integer :peca_id
      t.integer :tarefa_id
      t.integer :produto_id
      t.integer :statu_id
      t.integer :chamado_id

      t.timestamps
    end
  end
end
