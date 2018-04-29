class SocialMediaAccount < ActiveRecord::Base

  belongs_to :sociable, polymorphic: true

end
