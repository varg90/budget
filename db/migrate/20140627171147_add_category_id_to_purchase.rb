class AddCategoryIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :category_id, :integer, references: :categories
    remove_column :purchases, :category
  end
end
