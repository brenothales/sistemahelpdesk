class CreateChamados < ActiveRecord::Migration
  def change
    create_table   :chamados do |t|
      t.string     :assunto
      t.text       :descricao, :limit => "30"
      t.string     :prioridade, :limit => "30"
      t.string     :tipoAtendimento, :limit => "30"
      t.boolean    :cortesia, :default => false
      t.text       :observacao
      t.boolean    :solucionado, :default => false
      t.boolean    :finalizaSolicitacao, :default => false
      t.boolean :cancelar, :default => false
      t.decimal    :valorGeral, :precision => 10, :scale => 2#, :null => false    
      t.string     :produto, :limit => "30"
      t.string     :status, :limit => "30"
      t.string      :slug
      t.references :user
      t.references :produto

      t.timestamps
    end
    add_index :chamados, :user_id
    add_index :chamados, :produto_id
  end
end
