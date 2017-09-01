class Debtor < ApplicationRecord
  has_many :credits
  has_many :payments, through: :credits
  validates :name,  presence: true, length: { maximum: 60 }, uniqueness: { case_sensitive: false }
end
