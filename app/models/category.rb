class Category < ActiveRecord::Base
  has_many :purchases
  validates :name, uniqueness: true, allow_blank: false
  paginates_per 20
end
