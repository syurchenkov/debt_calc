require 'rails_helper'

RSpec.describe Credit, type: :model do

  it { is_expected.to have_many(:payments) }
  it { is_expected.to belong_to(:debtor) }

  context 'validations' do 
    it { is_expected.to validate_numericality_of(:rate).only_integer }
    it { is_expected.to validate_numericality_of(:arrears_rate).only_integer }
    it { is_expected.to validate_numericality_of(:payment_period_in_months).only_integer }
    it { is_expected.to validate_numericality_of(:amount) }
  end
end
