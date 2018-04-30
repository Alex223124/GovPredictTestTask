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

end

