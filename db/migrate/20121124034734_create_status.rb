class CreateStatus < ActiveRecord::Migration
  def change
    create_table :status do |t|
      t.string :nome
      t.references :servico

      t.timestamps
    end
  end
end
