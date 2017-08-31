require 'rails_helper'

RSpec.describe "debtors/edit", type: :view do
  before(:each) do
    @debtor = assign(:debtor, Debtor.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit debtor form" do
    render

    assert_select "form[action=?][method=?]", debtor_path(@debtor), "post" do

      assert_select "input[name=?]", "debtor[name]"
    end
  end
end
