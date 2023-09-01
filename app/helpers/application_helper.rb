module ApplicationHelper
  def render_stars(rating)
    full_stars = rating.to_i
    empty_stars = 5 - full_stars

    stars_html = ""
    full_stars.times { stars_html += '<i class="fas fa-star"></i>' }
    empty_stars.times { stars_html += '<i class="far fa-star"></i>' }

    stars_html.html_safe
  end
end
