class AddSlugToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :slug, :string
  end
end
