class Purchase < ActiveRecord::Base
  validates :name, :group, :price, :date, presence: true
end
