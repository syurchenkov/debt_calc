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

  describe 'credit payment methods' do 
    subject(:credit) do 
      create(:credit, 
        amount: 10000, 
        payment_period_in_months: 10,
        rate: 12,
        arrears_rate: 24
      ) 
    end

    it 'month_payment == 1000' do 
      expect(credit.month_payment).to eq(Money.from_amount(1000))
    end

    it 'regular_payment == 1000 + 100' do 
      expect(credit.regular_payment).to eq(Money.from_amount(1100))
    end

    it 'arrear_payment == 1000 + 200' do 
      expect(credit.arrear_payment).to eq(Money.from_amount(1200))
    end

    it 'early_repayment == 9000' do 
      expect(credit.early_repayment).to eq(Money.from_amount(9000))
    end 
  end
end
