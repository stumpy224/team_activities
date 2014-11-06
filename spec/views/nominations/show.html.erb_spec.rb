require 'spec_helper'

describe "nominations/show" do
  before(:each) do
    @nomination = assign(:nomination, stub_model(Nomination,
      :restaurant_id => 1,
      :year => "Year"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Year/)
  end
end
