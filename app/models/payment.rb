class Payment < ApplicationRecord
  belongs_to :credit
  validates :date, date: true
  monetize :amount_cents

  before_save :validate_credit_payments_limit

  private 

  def validate_credit_payments_limit
    return nil if credit.payments.size < credit.payment_period_in_months
    errors.add(:credit, 'has maximum number of payments')
    raise ActiveRecord::Rollback
  end
end
