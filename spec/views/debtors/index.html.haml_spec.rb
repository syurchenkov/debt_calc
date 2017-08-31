require 'rails_helper'

RSpec.describe "debtors/index", type: :view do
  before(:each) do
    assign(:debtors, [
      Debtor.create!(
        :name => "Name"
      ),
      Debtor.create!(
        :name => "Name2"
      )
    ])
  end

  it "renders a list of debtors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
  end
end
