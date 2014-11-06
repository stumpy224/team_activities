require 'spec_helper'

describe "years/new" do
  before(:each) do
    assign(:year, stub_model(Year,
      :year => "MyString"
    ).as_new_record)
  end

  it "renders new year form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", years_path, "post" do
      assert_select "input#year_year[name=?]", "year[year]"
    end
  end
end
