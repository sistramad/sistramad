require 'rails_helper'

RSpec.describe "groups/edit", type: :view do
  before(:each) do
    @group = assign(:group, Group.create!(
      :name => "MyString",
      :code => "MyString",
      :description => "MyString",
      :active => false
    ))
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", group_path(@group), "post" do

      assert_select "input#group_name[name=?]", "group[name]"

      assert_select "input#group_code[name=?]", "group[code]"

      assert_select "input#group_description[name=?]", "group[description]"

      assert_select "input#group_active[name=?]", "group[active]"
    end
  end
end
