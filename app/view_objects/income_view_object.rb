class IncomeViewObject 
  attr_reader :main_debt_payments, :payments_of_interest, :credit

  def initialize(main_debt_payments, payments_of_interest, credit)
    @main_debt_payments = main_debt_payments
    @payments_of_interest = payments_of_interest
    @credit = credit
  end

  def real_income 
    ((@payments_of_interest / @main_debt_payments).to_f * 12 / @credit.payment_period_in_months * 100).round
  end
end