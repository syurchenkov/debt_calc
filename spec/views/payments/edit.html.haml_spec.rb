require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
  before(:each) do
    @payment = assign(:payment, create(:payment))
  end

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do

      assert_select "select[name=?]", "payment[credit_id]"

      assert_select "input[name=?]", "payment[amount]"
    end
  end
end
