require 'rails_helper'

RSpec.describe Debtor, type: :model do
  it { is_expected.to have_many(:credits) }
  it { is_expected.to have_many(:payments).through(:credits) }

  context 'validations' do 
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:name).is_at_most(60) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive } 
  end
end
