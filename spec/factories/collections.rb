FactoryGirl.define do
  factory :collection do
    sequence(:name) { |n| "Collection_#{n}" }
  end
end
