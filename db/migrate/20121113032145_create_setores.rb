class CreateSetores < ActiveRecord::Migration
  def change
    create_table :setores do |t|
      t.string :nome
      t.string :sala
      t.string :sigla
      t.string :codigo
      t.references :unidade

      t.timestamps
    end
    add_index :setores, :unidade_id
  end
end
