class Url < ApplicationRecord
  before_create :sanitize_url!, :short_url!

  validates :url, presence: true, format: {with: URI::regexp(%w(http https))}


  def self.generate_sanitize_url(url)
    "http://#{url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")}"
  end

  def sanitize_url!
    self.sanitize_url = Url.generate_sanitize_url(self.url)
  end

  def short_url!
    short_url = SecureRandom.base58(6)
    if Url.where(short_url: short_url).any?
      short_url!
    else
      self.short_url = short_url
    end
  end

  def visited!
    self.visits += 1
    self.save!
  end

end
