require 'rails_helper'

RSpec.describe "procedures/index", type: :view do
  before(:each) do
    assign(:procedures, [
      Procedure.create!(
        :name => "Name"
      ),
      Procedure.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of procedures" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
