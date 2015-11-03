require 'spec_helper'

describe "cutoffs/edit" do
  before(:each) do
    @cutoff = assign(:cutoff, stub_model(Cutoff))
  end

  it "renders the edit cutoff form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cutoff_path(@cutoff), "post" do
    end
  end
end
