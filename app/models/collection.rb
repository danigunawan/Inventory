class Collection < ApplicationRecord
  has_many :items
  validates :name, presence: true

  def any_low_stock_items?
    !(low_stock_items.count.zero?)
  end

  def low_stock_items
    items.where("quantity < 5")
  end
end
