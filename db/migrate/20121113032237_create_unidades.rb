class CreateUnidades < ActiveRecord::Migration
  def change
    create_table :unidades do |t|
      t.string :nome
      t.string :sigla
      t.string :fone
      t.string :cnpj
      t.integer :ramal

      t.timestamps
    end
  end
end
