class Visit < ApplicationRecord 
  
  def self.record_visit!(user, shortened_url)
    Visit.new(user_id: :user_id, url_id: :url_id)
  end
  
  belongs_to :visitors,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
end