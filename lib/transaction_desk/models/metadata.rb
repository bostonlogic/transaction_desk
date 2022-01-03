module TransactionDesk
  class Metadata < BaseModel
    attribute :name
    attribute :type
    attribute :can_filter
    attribute :can_sort
    attribute :filter_type

    attribute :default_take
    attribute :max_take
    attribute :default_order
  end
end
