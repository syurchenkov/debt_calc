require 'rails_helper'

RSpec.describe "payments/new", type: :view do
  before(:each) do
    assign(:payment, Payment.new)
  end

  it "renders new payment form" do
    render

    assert_select "form[action=?][method=?]", payments_path, "post" do

      assert_select "select[name=?]", "payment[credit_id]"

      assert_select "input[name=?]", "payment[amount]"
    end
  end
end
