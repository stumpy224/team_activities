require 'spec_helper'

describe "cutoffs/show" do
  before(:each) do
    @cutoff = assign(:cutoff, stub_model(Cutoff))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
