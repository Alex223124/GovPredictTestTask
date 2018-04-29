class CreateSocialMediaAccounts < ActiveRecord::Migration
  def change
    create_table :social_media_accounts do |t|
      t.string :name
      t.string :url
      t.string :media_type

      t.timestamps null: false
    end
  end
end
