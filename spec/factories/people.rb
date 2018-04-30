FactoryBot.define do
  factory :person do
    first_name "MyString"
    last_name "MyString"
  end

  trait :belogns_to_custom_list do
    association :custom_list, factory: [:custom_list, :custom_list_one]
  end

end
