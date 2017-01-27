# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')



[
  [0, "All"],
  [1, "Video"],
  [2, "Image"],
  [3, "Text"], 
].each do |category|
  WidgetCategory.where(name: category[1]).first_or_create(category_id: category[0])
end