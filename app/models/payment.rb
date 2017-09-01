class Payment < ApplicationRecord
  belongs_to :credit
  validates :date, date: true
  monetize :amount_cents
end
