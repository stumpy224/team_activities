require 'spec_helper'

describe "nominations/edit" do
  before(:each) do
    @nomination = assign(:nomination, stub_model(Nomination,
      :restaurant_id => 1,
      :year => "MyString"
    ))
  end

  it "renders the edit nomination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", nomination_path(@nomination), "post" do
      assert_select "input#nomination_restaurant_id[name=?]", "nomination[restaurant_id]"
      assert_select "input#nomination_year[name=?]", "nomination[year]"
    end
  end
end
