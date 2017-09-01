require 'rails_helper'

RSpec.describe "payments/show", type: :view do
  before(:each) do
    @payment = assign(:payment, create(:payment))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{Regexp.quote(@payment.credit.to_s)}/)
    expect(rendered).to match(/#{Regexp.quote(@payment.amount.to_s)}/)
  end
end
