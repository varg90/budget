class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :purchases, :group, :category
  end
end
