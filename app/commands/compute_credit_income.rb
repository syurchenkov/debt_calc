class ComputeCreditIncome
  prepend SimpleCommand

  def initialize(credit_id)
    @credit_id = credit_id
  end

  def call
    credit = Credit.includes(:payments).find_by(id: @credit_id)

    if credit && credit.payments.exists?

      payments_sum = credit.payments.map(&:amount).reduce(:+)

      main_debt_payments = credit.month_payment * credit.payment_period_in_months

      payments_of_interest = payments_sum - main_debt_payments

      return main_debt_payments, payments_of_interest, credit
    elsif credit.nil?
      errors.add(:credit, 'Credit is not found')
    else
      errors.add(:credit, 'Payments of this credit are not found')
    end
    nil
  end
end
