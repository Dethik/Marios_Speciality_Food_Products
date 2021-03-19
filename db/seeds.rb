# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all

10.times do |index|
  Product.create!(name: Faker::Food.unique.vegetables, country: Faker::Address.country, price: Faker::Number.decimal(2).to_i)
end

10.times do |index|
  Product.create!(name: Faker::Food.unique.fruits, country: Faker::Address.country, price: Faker::Number.decimal(2).to_i)
end

Product.all.each do |product|
  5.times do |index|
    char_num = rand(50..250)
    product.reviews.create(author: Faker::Name.name, content_body: Faker::Lorem.paragraph_by_chars(char_num, false), rating: Faker::Number.between(1, 5), product_id: product.id)
  end
end