FactoryBot.define do
  factory :social_media_account do
    name "MyString"
    url "MyString"
    media_type "MyString"
  end

  trait :twitter_media_type do
    media_type "twitter"
  end

  trait :facebook_media_type do
    media_type "facebook"
  end

  trait :legislator_plus_twitter_media_type do
    media_type "twitter"
    association :sociable, factory: [:federal_legislator]
  end

  trait :legislator_plus_facebook_media_type do
    media_type "facebook"
    association :sociable, factory: [:federal_legislator]
  end


  trait :person_plus_twitter_media_type do
    media_type "twitter"
    association :sociable, factory: [:person, :belogns_to_custom_list]
  end

  trait :person_plus_facebook_media_type do
    media_type "facebook"
    association :sociable, factory: [:person, :belogns_to_custom_list]
  end

end
