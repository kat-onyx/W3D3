class User < ApplicationRecord
  validates :name, :email, presence: true, uniqueness: true
  # validates :email, uniqueness: true
  
  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl
end