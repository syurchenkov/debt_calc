FactoryGirl.define do
  sequence :debtor_name do |n|
    "Debtor#{n}"
  end

  factory :debtor do
    name { FactoryGirl.generate :debtor_name }
  end
end
