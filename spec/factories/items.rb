FactoryGirl.define do
  factory :item do
    sequence(:name){ |n| "item_#{n}" }
    collection

    trait :low_stock_item do
      quantity 1
    end

    trait :empty_stock_item do
      quantity 0
    end

    trait :stocked_item do
      quantity 5
    end
  end
end
