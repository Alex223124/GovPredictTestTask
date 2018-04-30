require 'rails_helper'

describe MessagesFilterForm do

  after(:each) do
    Message.all.destroy_all
  end

  context '#filter_by_date_range' do

    before(:each) do
      @first = create(:message, :posted_one_month_ago)
      @second = create(:message, :posted_one_month_ago)
      @third = create(:message, :posted_two_months_ago)
      @fourth = create(:message, :posted_two_months_ago)
      @fifth = create(:message, :posted_two_weeks_ago)
      @sixth =  create(:message, :posted_two_weeks_ago)
      @seventh = create(:message, :posted_three_months_ago)
      @eighth = create(:message, :posted_three_months_ago)
    end

    context "when @date_start and @date_end are present" do

      let(:expected_result) { [@first, @second, @third, @fourth, @fifth, @sixth] }

      it "should filter messages by date range" do
        filter_form = build(:messages_filter_form, :from_now_to_two_moths_ago)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_date_range)
        expect(filter_form.instance_variable_get("@relation")).to match_array(expected_result)
      end

    end

    context "when @date_start and @date_end are not present" do

      let(:expected_result) { [@first, @second, @third, @fourth, @fifth, @sixth, @seventh, @eighth] }

      it "shouldn't change amount of objects in @raleation" do
        filter_form = build(:messages_filter_form, :blank_start_and_end_dates)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_date_range)
        expect(filter_form.instance_variable_get("@relation")).to match_array(expected_result)
      end

    end

    context "when only @date_start is present" do

      let(:expected_result) { [@first, @second, @third, @fourth, @fifth, @sixth, @seventh, @eighth] }

      it "shouldn't change amout of objects in @raleation" do
        filter_form = build(:messages_filter_form, :blank_ony_end_date)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_date_range)
        expect(filter_form.instance_variable_get("@relation")).to match_array(expected_result)
      end

    end

    context "when only @date_end is present" do

      let(:expected_result) { [@first, @second, @third, @fourth, @fifth, @sixth, @seventh, @eighth] }

      it "shouldn't change amout of objects in @raleation" do
        filter_form = build(:messages_filter_form, :blank_ony_start_date)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_date_range)
        expect(filter_form.instance_variable_get("@relation")).to match_array(expected_result)
      end

    end

    context "when @date_end and @date_start have incorrect values" do

      let(:expected_result) { [@first, @second, @third, @fourth, @fifth, @sixth, @seventh, @eighth] }

      it "shouldn't change amout of objects in @raleation" do
        filter_form = build(:messages_filter_form, :incorrect_date_start_and_date_end)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_date_range)
        expect(filter_form.instance_variable_get("@relation")).to match_array(expected_result)
      end

    end

  end

  context "#select_(allowed_list)" do

    context "when @lists contains allowed static lists" do

      it "should select allowed lists" do
        filter_form = build(:messages_filter_form, :with_static_lists)
        list = filter_form.send(:select_, MessagesFilterForm::STATIC_LISTS)
        expected_result = ["FederalLegislator"]
        expect(list).to match_array(expected_result)
      end

    end

    context "when @lists doesnt contain allowed static lists" do

      it "should return blank array" do
        filter_form = build(:messages_filter_form, :with_incorrect_lists_names)
        list = filter_form.send(:select_, MessagesFilterForm::STATIC_LISTS)
        expect(list).to match_array([])
      end

    end

    context "when @lists contains allowed custom lists" do

      it "should select custom lists" do
        filter_form = build(:messages_filter_form, :with_custom_lists)
        MessagesFilterForm.const_set("CUSTOM_LISTS", ["Custom List One", "Custom List Two", "Custom List Three" ])
        list = filter_form.send(:select_, MessagesFilterForm::CUSTOM_LISTS)
        expected_result = ["Custom List One", "Custom List Two", "Custom List Three" ]
        expect(list).to match_array(expected_result)
      end

    end

    context "when @lists doesnt contain allowed custom lists" do

      it "should return blank array" do
        filter_form = build(:messages_filter_form, :with_incorrect_lists_names)
        MessagesFilterForm.const_set("CUSTOM_LISTS", ["Custom List One", "Custom List Two", "Custom List Three" ])
        list = filter_form.send(:select_, MessagesFilterForm::CUSTOM_LISTS)
        expect(list).to match_array([])
      end

    end

  end

  context "#select_allowed_social_media" do

    context "when @social_media_types contains allowed social media types" do

      it "should select allowed social media types" do
        filter_form = build(:messages_filter_form, :with_allowed_social_media_types)
        list = filter_form.send(:select_allowed_social_media)
        expected_result = ["twitter", "facebook"]
        expect(list).to match_array(expected_result)
      end

    end

    context "when @social_media_types doesnt contain allowed social media sites" do

        it "should return blank array" do
          filter_form = build(:messages_filter_form, :with_incorrect_lists_names)
          list = filter_form.send(:select_allowed_social_media)
          expect(list).to match_array([])
        end

    end

  end

  context "#filter_by_social_media" do

    context "when correct types are present" do

      before(:each) do
        @first = create(:message, :with_twitter_soc_media_account)
        @second = create(:message, :with_facebook_soc_media_account)
        @third = create(:message)
        @fourth = create(:message)
        @fifth = create(:message)
      end

      let(:expected_result) { [@first, @second] }

      it "should filter messages by date range" do
        filter_form = build(:messages_filter_form, :with_allowed_social_media_types)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_social_media)
        expect(filter_form.instance_variable_get("@relation")).to match_array(expected_result)
      end

    end

    context "when types are not present" do

      before(:each) do
        @first = create(:message, :posted_one_month_ago)
        @second = create(:message, :posted_one_month_ago)
        @third = create(:message, :posted_two_months_ago)
        @fourth = create(:message, :posted_two_months_ago)
      end

      let(:expected_result) { [@first, @second, @third, @fourth] }

      it "shouldn't change amount of objects in @raleation" do
        filter_form = build(:messages_filter_form)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_social_media)
        expect(filter_form.instance_variable_get("@relation")).to match_array(expected_result)
      end

    end

    context "when form has incorrect values in @social_media_lists" do

      before(:each) do
        @first = create(:message, :posted_one_month_ago)
        @second = create(:message, :posted_one_month_ago)
        @third = create(:message, :posted_two_months_ago)
      end

      let(:expected_result) { [@first, @second, @third] }

      it "shouldn't change amount of objects in @raleation" do
        filter_form = build(:messages_filter_form, :with_incorrect_social_media_types)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_social_media)
        expect(filter_form.instance_variable_get("@relation")).to match_array(expected_result)
      end

    end

  end

  context "#filter_by_static_lists" do

    context "when @lists contains allowed static lists" do

      before(:each) do
        @first = create(:message, :with_legislator_and_twitter_soc_media_account)
        @second = create(:message, :with_legislator_and_facebook_soc_media_account)
      end

      let(:expected_result) { [@first, @second] }

      it "should retrun messages with static lists in sociable_type" do
        filter_form = build(:messages_filter_form, :with_static_lists)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_static_lists)
        expect(filter_form.instance_variable_get("@messages_from_static_lists")).to match_array(expected_result)
      end

    end

    context "when @lists doesnt contain allowed static lists" do

      before(:each) do
        @first = create(:message)
        @second = create(:message)
        @third = create(:message)
      end

      it "shouldn't set @messages_from_static_lists" do
        filter_form = build(:messages_filter_form)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_static_lists)
        expect(filter_form.instance_variable_get("@messages_from_static_lists")).to eq(nil)
      end

    end

    context "when @lists contains incorrect data" do

      before(:each) do
        @first = create(:message)
        @second = create(:message)
        @third = create(:message)
      end

      it "shouldn't set @messages_from_static_lists" do
        filter_form = build(:messages_filter_form, :with_incorrect_lists_names)
        filter_form.instance_variable_set("@relation", Message.all)
        filter_form.send(:filter_by_static_lists)
        expect(filter_form.instance_variable_get("@messages_from_static_lists")).to eq(nil)
      end

    end

  end

end

