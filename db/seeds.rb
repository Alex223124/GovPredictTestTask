def create_twitter_posts
  url_to_tweet = "https://twitter.com/marketing_sassy/status/934909205521117184"
  twitter_posts = []
  3.times do
    twitter_posts << Message.create(link: url_to_tweet, content: Faker::ChuckNorris.fact,
                                    posted_at: Faker::Date.backward(10))
  end
  twitter_posts
end

def create_facebook_posts
  url_to_fb_post = 'https://www.facebook.com/photo.php?fbid=158949451608235&set=a.136878697148644.1073741829.100024795442927&type=3&theater'
  facebook_posts = []
  3.times do
    facebook_posts << Message.create(link: url_to_fb_post, content: Faker::ChuckNorris.fact,
                                     posted_at: Faker::Date.backward(10))
  end
  facebook_posts
end


def create_social_media_accounts
  social_media_accounts = []
  social_media_accounts << SocialMediaAccount.create(media_type: "twitter", name: "Alex In Dev",
                                                     url: "https://twitter.com/AlexInDev")
  social_media_accounts << SocialMediaAccount.create(media_type: "facebook", name: "Alex Mercer",
                                                     url: "https://www.facebook.com/alex.abram.1213")
end

def connect_messages_and_social_media_accounts(social_media_accs = create_social_media_accounts)
  ## Put messages to media accounts
  social_media_accs.each do |account|
    if account.media_type == "facebook"
      account.messages << create_facebook_posts
    elsif account.media_type == "twitter"
      account.messages << create_twitter_posts
    end
  end
  social_media_accs
end

def add_soc_media_accounts_to_person
  a = Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  connect_messages_and_social_media_accounts.each do |soc_media_account|
    a.social_media_accounts << soc_media_account
  end
  a
end

def add_person_to_custom_list
  titles = ["First Custom List", "Second Custom List", "Third Custom List"]
  titles.each do |title|
    a = CustomList.create(title: title)
    a.persons << add_soc_media_accounts_to_person
  end
end

def add_soc_media_accounts_to_federal_legislator
  a = FederalLegislator.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                               enters_office_on: Faker::Date.between(3.year.ago, 2.year.ago),
                               leaves_office_on: Faker::Date.forward(100))
  connect_messages_and_social_media_accounts.each do |soc_media_account|
    a.social_media_accounts << soc_media_account
  end
end

add_person_to_custom_list
add_soc_media_accounts_to_federal_legislator
















