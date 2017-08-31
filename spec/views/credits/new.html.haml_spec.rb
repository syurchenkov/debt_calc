require 'rails_helper'

RSpec.describe "credits/new", type: :view do
  before(:each) do
    assign(:credit, Credit.new)
  end

  it "renders new credit form" do
    render

    assert_select "form[action=?][method=?]", credits_path, "post" do

      assert_select "select[name=?]", "credit[debtor_id]"

      assert_select "input[name=?]", "credit[amount]"

      assert_select "input[name=?]", "credit[rate]"

      assert_select "input[name=?]", "credit[arrears_rate]"

      assert_select "input[name=?]", "credit[payment_period_in_months]"
    end
  end
end
