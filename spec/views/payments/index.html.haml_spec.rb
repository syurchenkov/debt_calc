require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      create(:payment),
      create(:payment)
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => create(:payment).amount.to_s, :count => 2
  end
end
