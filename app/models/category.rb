class Category < ActiveRecord::Base
  has_many :purchases
  validates :name, uniqueness: true, allow_blank: false
end
