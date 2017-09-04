FactoryGirl.define do
  factory :payment do
    credit { create(:credit) }
    amount { credit.regular_payment }
    date "2017-09-01"
    is_arrear false
    is_early_repayment false

    trait :arrear do 
      is_arrear true
      amount { credit.arrear_payment }
    end

    trait :early do 
      is_early_repayment true
      amount { ((is_arrear) ? (credit.arrear_payment):(credit.regular_payment)) + credit.early_repayment }
    end
  end
end
