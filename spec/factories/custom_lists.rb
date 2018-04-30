FactoryBot.define do
  factory :custom_list do
    title "MyString"
  end

  trait :custom_list_one do
    title ["Custom List One", "Custom List Two"].sample
  end

end
