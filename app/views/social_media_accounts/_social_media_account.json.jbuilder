json.extract! social_media_account, :id, :name, :url, :media_type, :created_at, :updated_at
json.url social_media_account_url(social_media_account, format: :json)
