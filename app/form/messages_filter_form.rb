class MessagesFilterForm
  include Virtus.model

  SOCIAL_MEDIA = ["facebook", "twitter"].freeze

  attribute :date_start, Date
  attribute :date_end, Date
  attribute :social_media_types, Array

  def apply_filter(relation)
    @relation = relation
    filter_by_date_range
    filter_by_social_media
    @relation
  end

  private

  def filter_by_date_range
    if (@date_start.present? && @date_end.present?)
      @relation = @relation.where('(messages.posted_at >= ? AND messages.posted_at <= ?)', @date_start, @date_end)
    end
  end

  def filter_by_social_media
    types = select_allowed_social_media
    if types.present?
      @relation = @relation.where(social_media_account: SocialMediaAccount.where(media_type: types))
    end
  end

  def select_allowed_social_media
    @social_media_types.select {|type| SOCIAL_MEDIA.include?(type)}
  end

end
