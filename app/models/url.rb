class Url < ApplicationRecord
  validates :current_url, presence: true
  validates :short_url, presence: true
  validates :sanitize_url, presence: true


  def sanitize_url!
    self.sanitize_url = "http://#{self.current_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")}"
  end

  def short_url!
    uuid = Digest::MD5.hexdigest(current_url).slice(0..5)
    self.short_url = uuid
  end
end
