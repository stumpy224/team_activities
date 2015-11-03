require 'spec_helper'

describe "cutoffs/index" do
  before(:each) do
    assign(:cutoffs, [
      stub_model(Cutoff),
      stub_model(Cutoff)
    ])
  end

  it "renders a list of cutoffs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
