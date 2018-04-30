FactoryBot.define do
  factory :messages_filter_form do
    date_start "2018-04-01".to_date
    date_end "2018-04-30".to_date
  end

  trait :from_now_to_two_moths_ago do
    date_start (DateTime.now - 2.month)
    date_end DateTime.now
  end

  trait :blank_start_and_end_dates do
    date_start ""
    date_end ""
  end

  trait :blank_ony_end_date do
    date_start DateTime.now
    date_end ""
  end

  trait :incorrect_date_start_and_date_end do
    date_start "aa342332R@@2325T#T@%523"
    date_end "#@#@$#@432rw33r33"
  end

  trait :blank_ony_start_date do
    date_start ""
    date_end DateTime.now
  end

  trait :with_static_lists do
    lists ["FederalLegislator"]
  end

  trait :with_custom_lists do
    lists ["Custom List One", "Custom List Two", "Custom List Three" ]
  end

  trait :with_incorrect_lists_names do
    lists ["aa342332R@@2325T#T@%523", "@#$#^##^$wewewe", "#@#@$#@432rw33r33"]
  end

  trait :with_incorrect_social_media_types do
    social_media_types ["aa342332R@@2325T#T@%523", "@#$#^##^$wewewe", "#@#@$#@432rw33r33"]
  end

  trait :with_allowed_social_media_types do
    social_media_types ["twitter", "facebook"]
  end

end
