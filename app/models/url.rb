class Url < ApplicationRecord
  validates :current_url, presence: true
  validates :short_url, presence: true
  validates :sanitize_url, presence: true
end
