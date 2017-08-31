require 'rails_helper'

RSpec.describe "debtors/index", type: :view do
  before(:each) do
    assign(:debtors, [
      Debtor.create!(
        :name => "Name"
      ),
      Debtor.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of debtors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
