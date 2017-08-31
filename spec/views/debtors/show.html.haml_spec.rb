require 'rails_helper'

RSpec.describe "debtors/show", type: :view do
  before(:each) do
    @debtor = assign(:debtor, Debtor.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
