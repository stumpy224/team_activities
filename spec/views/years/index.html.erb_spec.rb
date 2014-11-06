require 'spec_helper'

describe "years/index" do
  before(:each) do
    assign(:years, [
      stub_model(Year,
        :year => "Year"
      ),
      stub_model(Year,
        :year => "Year"
      )
    ])
  end

  it "renders a list of years" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Year".to_s, :count => 2
  end
end
