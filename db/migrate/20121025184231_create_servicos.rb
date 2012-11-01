class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.string  :nome
      t.text    :observacao
      t.boolean :completado, default: false, null: false
      t.decimal :valorServico, :precision => 10, :scale => 2
      t.integer :chamado_id

      t.timestamps
    end
  end
end
