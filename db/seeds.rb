# Clear existing reviews if you want to start fresh each time you seed
Review.destroy_all
UserReviewPlatform.destroy_all
ReviewPlatform.destroy_all
ReviewCategory.destroy_all
User.destroy_all
Category.destroy_all


User.create!(
  email: "mateo.florian@gmail.com",
  password: "123123"
)
puts "User has been generated."

platform_list = ["google", "yelp"]

platform_list.each do |name|
  ReviewPlatform.create!(
    name: name,
    logo_url: "fa-brands fa-#{name}"
  )
end

puts "Review platform havs been generated."

ReviewPlatform.all.each do |platform|
  UserReviewPlatform.create!(
    user: User.last,
    review_platform: platform
  )
end

puts "Associations have been generated."

categories_list = [
  { name: "Price", logo_url: "fas fa-dollar-sign" },
  { name: "Menu Variety", logo_url: "fas fa-utensils" },
  { name: "Food Quality", logo_url: "fas fa-bread-slice" },
  { name: "Service", logo_url: "fas fa-concierge-bell" },
  { name: "Atmosphere", logo_url: "fa-solid fa-couch" },
  { name: "Hygiene", logo_url: "fas fa-hand-sparkles" },
  { name: "Wait Time", logo_url: "fas fa-clock" },
  { name: "Ambience", logo_url: "fas fa-spa" },
  { name: "Location", logo_url: "fas fa-map-marker-alt" },
  { name: "Noise Level", logo_url: "fas fa-volume-up" }
]

categories_list.each do |category|
  Category.create!(name: category[:name], logo_url: category[:logo_url])
end

20.times do
  Review.create!(
    reviewer_name: Faker::Name.name,
    user_review_platform: UserReviewPlatform.last, # Corrected here
    rating: rand(1..5),
    content: Faker::Restaurant.review,
    date: Faker::Date.backward(days: rand(0..7)),
    status: "open"
  )
end
puts "20 fake reviews have been generated."

80.times do
  Review.create!(
    reviewer_name: Faker::Name.name,
    user_review_platform: UserReviewPlatform.all.sample,
    rating: rand(1..5),
    content: Faker::Restaurant.review,
    date: Faker::Date.backward(days: rand(8..30)),
    status: "closed"
  )
  rand(1..3).times do
    category = Category.all.sample
    until category != ReviewCategory.last&.category
      category = Category.all.sample
    end
    ReviewCategory.create!(
      review: Review.last,
      category: category
    )
  end
end
puts "80 fake closed reviews with categories have been generated."
