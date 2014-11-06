require 'spec_helper'

describe "years/show" do
  before(:each) do
    @year = assign(:year, stub_model(Year,
      :year => "Year"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Year/)
  end
end
