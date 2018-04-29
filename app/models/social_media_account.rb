class SocialMediaAccount < ActiveRecord::Base

  belongs_to :sociable, polymorphic: true
  has_many :messages
  
end
