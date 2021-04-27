class AddImagesToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :images, :text, :array => true, :default => []
  end
end
