class CreateChamados < ActiveRecord::Migration
  def change
    create_table   :chamados do |t|
      t.string     :assunto
      t.text       :descricao
      t.string     :prioridade, :limit => "30"
      t.string     :tipoAtendimento, :limit => "30"
      t.boolean    :cortesia, :default => false
      t.text       :observacao
      t.boolean    :solucionado, :default => false
      t.boolean    :finalizaSolicitacao, :default => false
      t.boolean    :cancelar, :default => false
      t.boolean    :querofinalizar, :default => false
      t.decimal    :valorGeral, :precision => 10, :scale => 2#, :null => false    
      t.string     :produto, :limit => "30"
      t.string     :status, :limit => "30", default: "Aguardando Atendimento"
      t.string      :slug
      t.references :user
      t.references :setor
      t.references :cliente
      t.references :funcionario

      t.timestamps
    end
    add_index :chamados, :user_id
    add_index :chamados, :setor_id
    add_index :chamados, :funcionario_id
    add_index :chamados, :cliente_id
  end
end
