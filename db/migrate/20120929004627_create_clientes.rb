class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome, :limit => "50"
      t.string :cnpj, :limit => "18"
      t.string :cpf, :limit => "14"
      t.string :responsavel, :limit => "50"
      t.references :tipo_cliente
      t.string :complemento, :limit => "140"
      t.string :rg, :limit => "20"
      t.string :sexo, :limit => "20"
      t.string :dataNascimento, :limit => "10"
      t.string :funcao, :limit => "30"
      t.text :observacao
      t.references :user

      t.timestamps
    end
    add_index :clientes, :tipo_cliente_id
    add_index :clientes, :user_id
  end
end
