class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :logradouro, :limit => "50"
      t.string :numero, :limit => "50"
      t.string :bairro, :limit => "50"
      t.string :cidade, :limit => "50"
      t.string :uf, :limit => "2"
      t.string :cep, :limit => "20"
      t.references :cliente

      t.timestamps
    end
    add_index :enderecos, :cliente_id
  end
end
