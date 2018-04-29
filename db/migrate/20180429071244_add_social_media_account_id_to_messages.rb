class AddSocialMediaAccountIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :social_media_account_id, :integer
  end
end
