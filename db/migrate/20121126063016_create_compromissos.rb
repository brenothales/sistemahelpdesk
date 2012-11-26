class CreateCompromissos < ActiveRecord::Migration
  def change
    create_table :compromissos do |t|
      t.string  :nome, :limit => 30
      t.text    :observacao
      t.date    :published_on
      t.boolean :completado, default: false, null: false
      t.decimal :valorServico, :precision => 10, :scale => 2
      t.integer :chamado_id
      t.integer :chamado_id
      t.integer :servico_id
      t.integer :funcionario_id

      t.timestamps
    end
  end
end



