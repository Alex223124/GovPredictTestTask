class AddSociableIdAndSociableTypeToSocialMediaAccount < ActiveRecord::Migration
  def change
    add_column :social_media_accounts, :sociable_id, :integer
    add_column :social_media_accounts, :sociable_type, :string
  end
end
