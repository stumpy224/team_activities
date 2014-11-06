require 'spec_helper'

describe "nominations/new" do
  before(:each) do
    assign(:nomination, stub_model(Nomination,
      :restaurant_id => 1,
      :year => "MyString"
    ).as_new_record)
  end

  it "renders new nomination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", nominations_path, "post" do
      assert_select "input#nomination_restaurant_id[name=?]", "nomination[restaurant_id]"
      assert_select "input#nomination_year[name=?]", "nomination[year]"
    end
  end
end
