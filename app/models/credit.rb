class Credit < ApplicationRecord
  has_many :payments

  belongs_to :debtor

  validates :rate, numericality: { only_integer: true }
  validates :arrears_rate, numericality: { only_integer: true }
  validates :payment_period_in_months, numericality: { only_integer: true }
  validates :date, date: true

  monetize :amount_cents

  def to_s
    format('%d %s, %s, %s', id, date, debtor.name, amount)
  end

  def month_payment
    amount / payment_period_in_months
  end

  def regular_payment 
    month_payment + amount * rate / 100 / 12
  end

  def arrear_payment
    month_payment + amount * arrears_rate / 100 / 12
  end

  def early_repayment
    (payment_period_in_months - payments.count - 1) * month_payment
  end
end
