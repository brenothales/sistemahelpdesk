class CreateChamados < ActiveRecord::Migration
  def change
    create_table   :chamados do |t|
      t.string     :assunto
      t.text       :descricao
      t.string     :prioridade
      t.string     :tipoAtendimento
      t.boolean    :cortesia
      t.text       :observacao
      t.boolean    :solucionado
      t.boolean    :finalizaSolicitacao
      t.decimal    :valorGeral
      t.string     :produto
      t.string     :status
      t.references :user
      t.references :produto

      t.timestamps
    end
    add_index :chamados, :user_id
    add_index :chamados, :produto_id
  end
end
