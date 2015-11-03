require 'spec_helper'

describe "cutoffs/new" do
  before(:each) do
    assign(:cutoff, stub_model(Cutoff).as_new_record)
  end

  it "renders new cutoff form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cutoffs_path, "post" do
    end
  end
end
