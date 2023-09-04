class AddLogoUrlToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :logo_url, :string
  end
end
