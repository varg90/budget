class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :group
      t.decimal :price

      t.timestamps
    end
  end
end
