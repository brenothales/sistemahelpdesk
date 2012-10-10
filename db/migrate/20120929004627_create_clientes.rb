class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cnpj
      t.string :cpf
      t.string :responsavel
      t.references :tipo_cliente
      t.string :complemento
      t.string :rg
      t.string :sexo
      t.date :dataNascimento
      t.string :funcao
      t.string :observacao
      t.references :user

      t.timestamps
    end
    add_index :clientes, :tipo_cliente_id
    add_index :clientes, :user_id
  end
end
