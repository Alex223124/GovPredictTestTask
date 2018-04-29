class FederalLegislator < ActiveRecord::Base

  has_many :social_media_accounts, as: :sociable

end
