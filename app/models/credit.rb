class Credit < ApplicationRecord
  belongs_to :debtor

  monetize :amount_cents
end
