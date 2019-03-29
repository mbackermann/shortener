class SetWebsiteTitleJob < ApplicationJob
  queue_as :default
  include HTTParty

  def perform(url)
    response = Nokogiri::HTML::Document.parse(HTTParty.get(url.current_url).body)
    url.title = response.title
    url.save
  end
end
