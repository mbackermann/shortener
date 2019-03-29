class Url < ApplicationRecord
  before_create :sanitize_url!, :short_url!

  validates :url, presence: true


  def self.generate_sanitize_url(url)
    "http://#{url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")}"
  end

  def sanitize_url!
    self.sanitize_url = Url.generate_sanitize_url(self.url)
  end

  def short_url!
    uuid = Digest::MD5.hexdigest(url).slice(0..5)
    self.short_url = uuid
  end

  def visited!
    self.visits += 1
    self.save!
  end

end
