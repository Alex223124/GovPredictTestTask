class Message < ActiveRecord::Base

  has_one :person, through: :social_media_account, :source => "sociable", source_type: "Person"
  belongs_to :social_media_account

end
