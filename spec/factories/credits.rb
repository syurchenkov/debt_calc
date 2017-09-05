FactoryGirl.define do
  factory :credit do
    debtor { create :debtor }
    date "2017-08-31"
    amount 100
    rate 1
    arrears_rate 1
    payment_period_in_months 4

    factory :credit_with_payments do 
      transient do
        payments_count 4
      end

      after(:create) do |credit, evaluator|
        create_list(:payment, evaluator.payments_count, credit: credit)
        credit.reload
      end
    end
  end
end
