# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
30.times do |i|
  category = Category.create(name: "Category ##{i + 1}")
  10.times do
    Purchase.create(name: Faker::Commerce.product_name, category: category,
                    date: rand(100).days.from_now, price: rand(10000000) * 0.5)
  end
end
