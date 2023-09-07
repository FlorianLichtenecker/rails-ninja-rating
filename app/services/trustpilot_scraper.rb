require 'nokogiri'
require "open-uri"

class TrustpilotScraper
  def self.call(user_review_platform)
    new(user_review_platform).scrape_page
  end

  def initialize(user_review_platform)
    @user_url = user_review_platform.user_url
    @user_review_platform_id = user_review_platform.id
  end

  def scrape_page
    html_file = URI.open(@user_url).read
    html_doc = Nokogiri::HTML.parse(html_file)

    halt_scraping = false

    html_doc.search("article").each do |element|
      if halt_scraping
        break
      end

      title = element.search("h2").text.strip
      content = element.search("p.typography_body-l__KUYFJ").text.strip
      reviewer = element.search(".link_internal__7XN06 .typography_heading-xxs__QKBS8").text.strip
      rating = element.css('img').attr('alt').value.strip[6]

      date_text = element.search("time").text.strip
      date =
        if date_text.match(/\d+ days ago/)
          days_ago = date_text.match(/(\d+)/)[1].to_i
          Date.today - days_ago
        elsif date_text.match(/\d+ hours ago/)
          hours_ago = date_text.match(/(\d+)/)[1].to_i
          Date.today - (hours_ago / 24.0).ceil
        else
          Date.parse(date_text)
        end
      existing_review = Review.find_by(reviewer_name: reviewer, date: date)
      if existing_review
        halt_scraping = true
        break
      end

      Review.create!(
        title: title,
        content: content,
        reviewer_name: reviewer,
        date: date,
        rating: rating,
        status: "open",
        user_review_platform_id: @user_review_platform_id
      )
    end
  end
end
