class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :name               , :limit => "50"
      t.string :modelo             , :limit => "50"   
      t.string :marca              , :limit => "50" 
      t.string :numeroSerie        , :limit => "150"      
      t.string :patrimonio         , :limit => "50"    
      t.string :numeroContrato     , :limit => "50"     
      t.text :acessorios             
      t.decimal :valorDespreciacao , :precision => 10, :scale => 2#, :null => false    
      t.string :seto               , :limit => "50"      
      t.text :observacao       
      t.boolean :situation, :default => true       
      t.references :category   
      t.references :setor   
      t.references :user   
      t.references :cliente   

      t.timestamps
    end
    add_index :produtos, :category_id
    add_index :produtos, :user_id
    add_index :produtos, :setor_id
    add_index :produtos, :cliente_id
  end
end
