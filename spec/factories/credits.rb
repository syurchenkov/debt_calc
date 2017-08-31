FactoryGirl.define do
  factory :credit do
    debtor { create :debtor }
    date "2017-08-31"
    amount 100
    rate 1
    arrears_rate 1
    payment_period_in_months 1
  end
end
