FactoryBot.define do
  factory :message do
    link "MyString"
    posted_at "2018-04-29 10:11:04"
    content "MyText"
  end

  trait :posted_two_weeks_ago do
    posted_at (DateTime.now - 2.weeks)
  end

  trait :posted_one_month_ago do
    posted_at (DateTime.now - 1.month)
  end

  trait :posted_two_months_ago do
    posted_at (DateTime.now - 2.months)
  end

  trait :posted_three_months_ago do
    posted_at (DateTime.now - 3.months)
  end

  trait :with_twitter_soc_media_account do
    association :social_media_account, factory: [:social_media_account, :twitter_media_type]
  end

  trait :with_facebook_soc_media_account do
    association :social_media_account, factory: [:social_media_account, :facebook_media_type]
  end

  trait :with_legislator_and_twitter_soc_media_account do
    association :social_media_account, factory: [:social_media_account, :legislator_plus_twitter_media_type]
  end

  trait :with_legislator_and_facebook_soc_media_account do
    association :social_media_account, factory: [:social_media_account, :legislator_plus_facebook_media_type]
  end

  trait :with_person_and_twitter_soc_media_account do
    association :social_media_account, factory: [:social_media_account, :person_plus_twitter_media_type]
  end

  trait :with_person_and_facebook_soc_media_account do
    association :social_media_account, factory: [:social_media_account, :person_plus_facebook_media_type]
  end
end
