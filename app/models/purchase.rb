class Purchase < ActiveRecord::Base
  belongs_to :category
  validates :name, :category_id, :price, :date, presence: true
  paginates_per 20
end
