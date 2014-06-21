class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :name
      t.string :group
      t.decimal :price
      t.date :date

      t.timestamps
    end
  end
end
