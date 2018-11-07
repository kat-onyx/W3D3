class ShortenedUrl < ApplicationRecord
  
  def self.random_code(user, long_url)
    short_url = SecureRandom::urlsafe_base64(16)
    until !ShortenedUrl.exists?(short_url)
      short_url = SecureRandom::urlsafe_base64(16)
    end
    ShortenedUrl.new(long_url: long_url, short_url: short_url, user_id: user.id)
  end
  
end

