FactoryGirl.define do
  factory :payment do
    credit { create(:credit) }
    amount { credit.regular_payment }
    date "2017-09-01"
    is_arrear '0'
    is_early_repayment false

    trait :arrear do 
      is_arrear '1'
      amount { credit.arrear_payment }
    end

    trait :early do 
      is_early_repayment true
      amount { ((is_arrear == '1') ? (credit.arrear_payment):(credit.regular_payment)) + credit.early_repayment }
    end
  end
end
