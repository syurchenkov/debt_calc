class Credit < ApplicationRecord
  has_many :payments

  belongs_to :debtor

  validates :rate, numericality: { only_integer: true }
  validates :arrears_rate, numericality: { only_integer: true }
  validates :payment_period_in_months, numericality: { only_integer: true }
  validates :date, date: true

  monetize :amount_cents

  def to_s 
    format("%d %s, %s, %s", id, date, debtor.name, amount)
  end

  def month_payment 
    amount / payment_period_in_months
  end
end
