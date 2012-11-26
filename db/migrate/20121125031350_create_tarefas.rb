class CreateTarefas < ActiveRecord::Migration
  def change
    create_table :tarefas do |t|
      t.string :nome , :limit => 150
      t.decimal :valor_tarefa, :precision => 10, :scale => 2
      t.boolean :cortesia,    :default => false
      t.boolean :completado,  :default => false
      t.text :descricao
      t.text :observacao
      t.references :servico

      t.timestamps
    end
    add_index :tarefas, :servico_id
  end
end
