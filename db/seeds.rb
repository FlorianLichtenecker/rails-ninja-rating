# Clear existing reviews if you want to start fresh each time you seed
Review.destroy_all
ReviewPlatform.destroy_all # Corrected here

ReviewPlatform.create!(
  name: "google",
  logo_url: "https://static-00.iconduck.com/assets.00/google-logo-icon-503x512-d3y72ufg.png"
)

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
