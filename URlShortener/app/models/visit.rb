class Visit < ApplicationRecord 
  
  def self.record_visit!(user, shortened_url)
    Visit.create!(user_id: :user_id, url_id: :url_id)
  end
  
  belongs_to :visitors,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
    
  belongs_to :shorted_urls,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl
  
end