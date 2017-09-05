class Payment < ApplicationRecord
  attr_accessor :is_arrear

  belongs_to :credit
  validates :date, date: true
  monetize :amount_cents

  before_save :validate_credit_payments_limit
  before_save :validate_payment

  private 

  def validate_credit_payments_limit
    return nil if credit.can_add_payment?
    errors.add(:credit, 'is closed')
    raise ActiveRecord::Rollback
  end

  def validate_payment
    payment_amount = amount.dup
    if is_arrear == '1' && !is_early_repayment
      amount_match_payment(payment_amount, credit.arrear_payment, 'arrear payment')
    elsif is_arrear == '0' && !is_early_repayment
      amount_match_payment(payment_amount, credit.regular_payment, 'regular payment')
    elsif is_arrear == '1' && is_early_repayment
      amount_match_payment(payment_amount, credit.arrear_payment + credit.early_repayment, 'early repayment') 
    else
      amount_match_payment(payment_amount, credit.regular_payment + credit.early_repayment, 'early repayment') 
    end
    nil
  end

  def amount_match_payment(amount, payment, name_of_payment)
    amount -= payment
    return amount if amount.zero?
    errors.add(:amount, "does not match #{ name_of_payment } (#{ payment })")
    raise ActiveRecord::Rollback
  end
end
