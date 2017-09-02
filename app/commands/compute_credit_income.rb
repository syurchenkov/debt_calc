class ComputeCreditIncome
  prepend SimpleCommand

  def initialize(credit_id) 
    @credit_id = credit_id
  end

  def call
    return nil if @credit_id.nil?

    credit = Credit.includes(:payments).find_by_id(@credit_id)

    if credit
      payments_sum = credit.payments.map(&:amount).reduce(:+)

      main_debt_payments = credit.month_payment * credit.payment_period_in_months

      payments_of_interest = payments_sum - main_debt_payments

      return IncomeViewObject.new(main_debt_payments, payments_of_interest, credit)
    else 
      errors.add(:credit, 'Credit is not found')
    end
    nil
  end
end