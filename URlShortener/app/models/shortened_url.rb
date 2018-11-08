class ShortenedUrl < ApplicationRecord
  
  def self.random_code(user, long_url)
    short_url = SecureRandom::urlsafe_base64(16)
    until !ShortenedUrl.exists?(short_url)
      short_url = SecureRandom::urlsafe_base64(16)
    end
    ShortenedUrl.new(long_url: long_url, short_url: short_url, user_id: user.id)
  end
  
  def num_clicks
    visits.count
  end
  
  def num_uniques 
    visits.select(:user_id).distinct.count 
  end 
  
  def num_recent_uniques 
  end 
  
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
    
  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit
    
end

