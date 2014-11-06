require 'spec_helper'

describe "years/edit" do
  before(:each) do
    @year = assign(:year, stub_model(Year,
      :year => "MyString"
    ))
  end

  it "renders the edit year form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", year_path(@year), "post" do
      assert_select "input#year_year[name=?]", "year[year]"
    end
  end
end
