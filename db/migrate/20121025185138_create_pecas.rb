class CreatePecas < ActiveRecord::Migration
  def change
    create_table :pecas do |t|
      t.string :nome
      t.string :codigo
      t.decimal :valorPeca, :precision => 10, :scale => 2
      t.boolean :trocarPeca, :default => false
      t.text :observacao
      t.integer :servico_id

      t.timestamps
    end
  end
end
