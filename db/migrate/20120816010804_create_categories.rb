class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name       , :limit => "50"
      t.boolean :situation,:default => true

      t.timestamps
    end
  end
end

