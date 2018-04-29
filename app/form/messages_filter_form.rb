class MessagesFilterForm
  include Virtus.model

  attribute :date_start, Date
  attribute :date_end, Date

  def apply_filter(relation)
    @relation = relation
    filter_by_date_range
    @relation
  end

  private

  def filter_by_date_range
    if (@date_start.present? && @date_end.present?)
      @relation = @relation.where('(messages.posted_at >= ? AND messages.posted_at <= ?)', @date_start, @date_end)
    end
  end

end
