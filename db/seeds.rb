debtors = Array.new(4) { |i| Debtor.create!(name: "Debtor#{i + 1}") }

credits = Array.new(3) do |i|
  Credit.create!(
    debtor: debtors[i], 
    amount: Money.from_amount(1_000_000),
    rate: 30,
    arrears_rate: 50,
    payment_period_in_months: 6,
    date: DateTime.now.to_date
  )
end

# payments of first credit
(1..6).each do 
  Payment.create!(
    credit: credits[0],
    amount: Money.from_amount(191_666.67),
    is_arrear: '0',
    is_early_repayment: false,
    date: DateTime.now.to_date
  )
end

# payments of second credit
(1..3).each do 
  Payment.create!(
    credit: credits[1],
    amount: Money.from_amount(191_666.67),
    is_arrear: '0',
    is_early_repayment: false,
    date: DateTime.now.to_date
  )
end

Payment.create!(
  credit: credits[1],
  amount: Money.from_amount(525_000.01),
  is_arrear: '0',
  is_early_repayment: true,
  date: DateTime.now.to_date
)

# payments of third credit
(1..2).each do 
  Payment.create!(
    credit: credits[2],
    amount: Money.from_amount(191_666.67),
    is_arrear: '0',
    is_early_repayment: false,
    date: DateTime.now.to_date
  )
end

(1..4).each do 
  Payment.create!(
    credit: credits[2],
    amount: Money.from_amount(208_333.34),
    is_arrear: '1',
    is_early_repayment: false,
    date: DateTime.now.to_date
  )
end