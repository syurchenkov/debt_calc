FactoryGirl.define do
  factory :payment do
    credit { create(:credit) }
    amount 100
    date "2017-09-01"
  end
end
