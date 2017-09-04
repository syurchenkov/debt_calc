class Payment < ApplicationRecord
  attr_accessor :is_arrear

  belongs_to :credit
  validates :date, date: true
  monetize :amount_cents

  before_save :validate_credit_payments_limit
  before_save :validate_payment

  private 

  def validate_credit_payments_limit
    return nil if credit.payments.size < credit.payment_period_in_months
    errors.add(:credit, 'has maximum number of payments')
    raise ActiveRecord::Rollback
  end

  def validate_payment
    payment_amount = amount.dup
    if is_arrear == '0'
      amount_match_payment(payment_amount, credit.arrear_payment, 'arrear payment')
    else 
      amount_match_payment(payment_amount, credit.regular_payment, 'regular payment')
    end
    if is_early_repayment == '1'
      amount_match_payment(payment_amount, credit.early_repayment, 'early repayment') 
    end
    nil
  end

  private

  def amount_match_payment(amount, payment, name_of_payment)
    amount -= payment
    return amount unless amount.negative?
    errors.add(:amount, "does not match #{ name_of_payment } (#{ (-amount).to_s })")
    raise ActiveRecord::Rollback
  end

end
