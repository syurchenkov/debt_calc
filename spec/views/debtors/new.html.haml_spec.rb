require 'rails_helper'

RSpec.describe "debtors/new", type: :view do
  before(:each) do
    assign(:debtor, Debtor.new(
      :name => "MyString"
    ))
  end

  it "renders new debtor form" do
    render

    assert_select "form[action=?][method=?]", debtors_path, "post" do

      assert_select "input[name=?]", "debtor[name]"
    end
  end
end
