class Debtor < ApplicationRecord
  has_many :credits
  validates :name,  presence: true, length: { maximum: 60 }, uniqueness: { case_sensitive: false }
end
