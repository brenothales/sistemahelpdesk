class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :funcao, :limit => "48"
      t.string :ctps, :limit => "38"
      t.string :cpf, :limit => "14"
      t.string :rg, :limit => "20"
      t.string :sexo, :limit => "20"
      t.string :curso, :limit => "20"
      t.string :dataNascimento, :limit => "10"
      t.string :funcao, :limit => "30"
      t.text   :complemento



      t.references :user

      t.timestamps
    end
    add_index :funcionarios, :user_id
  end
end
