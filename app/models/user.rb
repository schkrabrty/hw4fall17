require 'securerandom'
class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :user_id, presence: true,
              length: {minimum: 8, maximum: 20},
              uniqueness: { case_sensitive: false }
    Valid_Email_Regex= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
              uniqueness: { case_sensitive: false },
              length: {maximum: 100},
              format: { with: Valid_Email_Regex }
    
    before_create :set_session_token
    
    private
    def set_session_token
        return if session_token.present?
        self.session_token = generate_session_token
    end
    
    def generate_session_token
        SecureRandom.base64
    end
end