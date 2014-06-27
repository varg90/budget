class AddCategoryIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :category_id, :integer, references: :categories
  end
end
