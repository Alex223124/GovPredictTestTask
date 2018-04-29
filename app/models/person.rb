class Person < ActiveRecord::Base

  belongs_to :custom_list
  has_many :social_media_accounts, as: :sociable
  has_many :messages, through: :social_media_accounts

end