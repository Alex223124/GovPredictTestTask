class MessagesFilterForm
  include Virtus.model

  STATIC_LISTS = ["FederalLegislator"].freeze
  CUSTOM_LISTS = CustomList.all.pluck(:title).freeze
  LISTS = (STATIC_LISTS + CUSTOM_LISTS).freeze
  SOCIAL_MEDIA = ["facebook", "twitter"].freeze

  attribute :date_start, Date
  attribute :date_end, Date
  attribute :lists, Array
  attribute :social_media_types, Array

  def apply_filter(relation)
    @relation = relation
    filter_by_date_range
    filter_by_social_media
    filter_by_static_lists
    filter_by_custom_lists
    merge_static_and_custom_lists_results
    @relation
  end

  private

  def filter_by_date_range
    if (@date_start.present? && @date_end.present?)
      @relation = @relation.where('(messages.posted_at >= ? AND messages.posted_at <= ?)', @date_start, @date_end)
    end
  end

  def filter_by_static_lists
    lists = select_(STATIC_LISTS)
    if lists.present?
      @messages_from_static_lists = @relation.where(social_media_account: SocialMediaAccount.where(sociable_type: lists))
    end
  end

  def filter_by_custom_lists
    lists = select_(CUSTOM_LISTS)
    if lists.present?
      ids_of_persons = Person.where(custom_list: CustomList.where(title: lists)).pluck(:id)
      @messages_from_custom_lists = @relation.where(social_media_account:
                                                        SocialMediaAccount.where(sociable_type: "Person",
                                                                                 sociable_id: ids_of_persons))
    end
  end

  def merge_static_and_custom_lists_results
    if (@messages_from_custom_lists && @messages_from_static_lists)
      @relation = @messages_from_static_lists + @messages_from_custom_lists
    elsif @messages_from_custom_lists.present?
      @relation = @messages_from_custom_lists
    elsif @messages_from_static_lists.present?
      @relation = @messages_from_static_lists
    end
  end

  def filter_by_social_media
    types = select_allowed_social_media
    if types.present?
      @relation = @relation.where(social_media_account: SocialMediaAccount.where(media_type: types))
    end
  end

  def select_(allowed_lists)
    @lists.select {|list| allowed_lists.include?(list)}
  end

  def select_allowed_social_media
    @social_media_types.select {|type| SOCIAL_MEDIA.include?(type)}
  end

end
