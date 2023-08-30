# Clear existing reviews if you want to start fresh each time you seed
Review.destroy_all
UserReviewPlatform.destroy_all
ReviewPlatform.destroy_all
User.destroy_all

ReviewPlatform.create!(
  name: "google",
  logo_url: "fa-brands fa-google"
)

puts "Review platform havs been generated."

20.times do
  Review.create!(
    reviewer_name: Faker::Name.name,
    review_platform: ReviewPlatform.last, # Corrected here
    rating: rand(1..5),
    content: Faker::Restaurant.review,
    date: Faker::Date.backward(days: 14),
    status: "open"
  )
end

puts "20 fake reviews have been generated."

User.create!(
  email: "123@123.com",
  password: "123123"
)

puts "User has been generated."

UserReviewPlatform.create!(
  user: User.last,
  review_platform: ReviewPlatform.last
)

puts "Associations have been generated."
