class Credit < ApplicationRecord
  belongs_to :debtor

  validates :rate, numericality: { only_integer: true }
  validates :arrears_rate, numericality: { only_integer: true }
  validates :payment_period_in_months, numericality: { only_integer: true }
  validates :date, date: true

  monetize :amount_cents
end
