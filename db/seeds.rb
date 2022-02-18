# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a user
User.create!(username: "admin", email: "admin@admin.mail", password: "123456");

# Add some categories
categories = ["Tech", "Other", "Funny" ]
Category.create!(categories.map { |ctg| {name: ctg}})

# Add some memes
(1..10).each do | num |
  fake_meme = {
    title: "Meme Title #{num}",
    type: "image",
    category: [Category.first, Category.second, Category.third][rand * 3],
    created_at: (rand * 3).days.ago,
    # Add random amount of votes
    votes_count: rand * 5,
    url_source: "http://localhost:3000/memes/#{num}.jpg",
    owner: User.first
  }
  Meme.create!(fake_meme)
end