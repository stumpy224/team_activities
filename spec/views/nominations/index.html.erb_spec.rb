require 'spec_helper'

describe "nominations/index" do
  before(:each) do
    assign(:nominations, [
      stub_model(Nomination,
        :restaurant_id => 1,
        :year => "Year"
      ),
      stub_model(Nomination,
        :restaurant_id => 1,
        :year => "Year"
      )
    ])
  end

  it "renders a list of nominations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
  end
end
