require 'rails_helper'

RSpec.describe "groups/new", type: :view do
  before(:each) do
    assign(:group, Group.new(
      :name => "MyString",
      :code => "MyString",
      :description => "MyString",
      :active => false
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input#group_name[name=?]", "group[name]"

      assert_select "input#group_code[name=?]", "group[code]"

      assert_select "input#group_description[name=?]", "group[description]"

      assert_select "input#group_active[name=?]", "group[active]"
    end
  end
end
