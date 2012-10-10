class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.references :category
      t.text :content
      t.date :published_at
      t.boolean :situation, :default => true
      t.references :author

      t.timestamps
    end
  end
end
