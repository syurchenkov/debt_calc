require 'rails_helper'

RSpec.describe "credits/index", type: :view do
  before(:each) do
    assign(:credits, [
      @credit1 = create(:credit),
      @credit2 = create(:credit)
    ])
  end

  it "renders a list of credits" do
    render
    assert_select "tr>td", :text => @credit1.debtor.name.to_s, :count => 1
    assert_select "tr>td", :text => @credit2.debtor.name.to_s, :count => 1
  end
end
