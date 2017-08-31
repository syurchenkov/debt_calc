require 'rails_helper'

RSpec.describe "credits/edit", type: :view do
  before(:each) do
    @credit = assign(:credit, create(:credit))
  end

  it "renders the edit credit form" do
    render

    assert_select "form[action=?][method=?]", credit_path(@credit), "post" do

      assert_select "select[name=?]", "credit[debtor_id]"

      assert_select "input[name=?]", "credit[amount]"

      assert_select "input[name=?]", "credit[rate]"

      assert_select "input[name=?]", "credit[arrears_rate]"

      assert_select "input[name=?]", "credit[payment_period_in_months]"
    end
  end
end
