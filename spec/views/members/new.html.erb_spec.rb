require 'spec_helper'

describe "members/new" do
  before(:each) do
    assign(:member, stub_model(Member,
      :identifier => "MyString",
      :name => "MyString",
      :active => false
    ).as_new_record)
  end

  it "renders new member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", members_path, "post" do
      assert_select "input#member_identifier[name=?]", "member[identifier]"
      assert_select "input#member_name[name=?]", "member[name]"
      assert_select "input#member_active[name=?]", "member[active]"
    end
  end
end
