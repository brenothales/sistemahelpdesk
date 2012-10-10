class CreateContatoEmails < ActiveRecord::Migration
  def change
    create_table :contato_emails do |t|
      t.string :contato
      t.string :email
      t.references :cliente

      t.timestamps
    end
    add_index :contato_emails, :cliente_id
  end
end
