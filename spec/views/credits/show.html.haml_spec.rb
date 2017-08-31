require 'rails_helper'

RSpec.describe "credits/show", type: :view do
  before(:each) do
    @credit = assign(:credit, @credit = create(:credit))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{Regexp.quote(@credit.debtor.name)}/)
    expect(rendered).to match(/#{Regexp.quote(@credit.amount.to_s)}/)
    expect(rendered).to match(/#{Regexp.quote(@credit.date.to_s)}/)
  end
end
