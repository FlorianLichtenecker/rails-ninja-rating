require 'nokogiri'
require "open-uri"

class TrustpilotScraper

  def self.call
    new.scrape_reviews
  end

  def scrape_reviews
    base_url = "https://www.trustpilot.com/review/www.tapasrevolution.com"
    sort_type = "recency"

    first_page_url = "#{base_url}?sort=#{sort_type}"
    scrape_page(first_page_url) # Scraping the first page

    total_pages = find_total_pages(first_page_url) # You will need to implement this method to find the total pages

    (2..total_pages).each do |page_number|
      url = "#{base_url}?page=#{page_number}&sort=#{sort_type}"
      scrape_page(url)
    end
  end

  def find_total_pages(url)
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML.parse(html_file)

    last_page_number = 1
    last_page_number = [last_page_number, html_doc.css('[name="pagination-button-last"]').text.to_i].max
    last_page_number = [last_page_number, html_doc.css('[name="pagination-button-3"]').text.to_i].max
    last_page_number = [last_page_number, html_doc.css('[name="pagination-button-2"]').text.to_i].max

    last_page_number
  end

  def scrape_page(url)
    html_file = URI.open(url).read
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
        user_review_platform_id: "1"
      )
    end
  end
end
